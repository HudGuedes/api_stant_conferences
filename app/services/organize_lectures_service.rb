require 'csv'
require 'base64'

class OrganizeLecturesService
  AVALIABLE_TIME_MORNING = 180
  AVALIABLE_TIME_EVENING = 240
  LUNCH_TIME = { name: 'Almoço', start_time: Time.new(0, 1, 1, 12, 0, 0, 0), duration: 60 }
  NETWORK_TIME = { name: 'Evento de Networking', start_time: Time.new(0, 1, 1, 17, 0, 0, 0), duration: 60 }

  def initialize(file)
    @file = file
    @tracks = []
  end

  def execute
    @data = read_file
    build_morning_tracks
    build_evening_tracks
    @tracks
  end

  private

  def read_file
    items = []
    CSV.parse(Base64.decode64(@file).force_encoding('UTF-8'), headers: false) do |row|
      items << {name: row[0], duration: row[1].to_i, start_time: row[1].to_i == 5 ? Time.new(0, 1, 1, 16, 0, 0, 0) : nil }
    end
    items
  end

  def build_morning_tracks
    total_tracks.times do |track|
      morning_duration = 0
      t = { morning_session: []}
      @data.each_with_index do |item, index|
        next if morning_duration >= AVALIABLE_TIME_MORNING || item[:duration] == 5
        morning_duration += item[:duration]
        if t[:morning_session].count == 0
          item[:start_time] = Time.new(0, 1, 1, 9, 0, 0, 0)
        else
          item[:start_time] = t[:morning_session].last[:start_time] + t[:morning_session].last[:duration].minutes
        end
        t[:morning_session] << item
      end
      t[:morning_session] << LUNCH_TIME
      @tracks << t[:morning_session]
      @data -= t[:morning_session]
    end
  end

  def build_evening_tracks
    total_tracks.times do |track|
      evening_duration = 0
      t = { evening_session: [] }
      @data.each do |item|
        next if evening_duration >= AVALIABLE_TIME_EVENING || item[:duration] == 5
        evening_duration += item[:duration]
        if t[:evening_session].count == 0
          item[:start_time] = Time.new(0, 1, 1, 13, 0, 0, 0)
        else
          item[:start_time] = t[:evening_session].last[:start_time] + t[:evening_session].last[:duration].minutes
        end
        t[:evening_session] << item
      end
      t[:evening_session] << @data.select{|item| item[:duration] == 5 }&.first if track == 1
      t[:evening_session] << NETWORK_TIME
      @tracks[track] += t[:evening_session]
      @data -= t[:evening_session]
    end
  end

  def total_time
    @data.map{|item| item[:duration] }.inject(:+)
  end

  def total_tracks
    @total_tracks ||= (total_time.to_f / (AVALIABLE_TIME_MORNING + AVALIABLE_TIME_EVENING)).round
  end
end

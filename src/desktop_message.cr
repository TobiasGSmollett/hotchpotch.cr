module Hotchpotch
  struct DesktopMessage
    getter message : String
    getter title : String?
    getter subtitle : String?
    getter sound_name : String?

    def initialize(@message, @title = nil, @subtitle = nil, @sound_name = nil)
    end

    def notify
      options = ""
      options += " title \"#{@title}\"" unless @title.nil?
      options += " subtitle \"#{@subtitle}\"" unless @subtitle.nil?
      options += " sound name \"#{@sound_name}\"" unless @sound_name.nil?
      command = "\"#{@message}\""
      command += " with #{options}" unless options.empty?
      system("osascript -e 'display notification #{command}'")
    end
  end
end

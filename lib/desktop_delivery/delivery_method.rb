module DesktopDelivery
  class DeliveryMethod
    def initialize(options = {})
      @path = options[:path] if options.key?(:path)
    end

    def deliver!(mail)
      @mail = mail

      create_path!
      create_file!
      open_file!
    end

    private

    def path
      @path ||= Etc.systmpdir
    end

    def mail
      @mail
    end

    def file_name
      prefix =  Time.now.strftime("%Y-%m-%d_%H-%M-%S_%3N_")
      name   = mail.subject.to_s.split(/\W/).join("-")
      ext    = ".eml"
      prefix + name + ext
    end

    def file_path
      @file_path ||= File.join(path, file_name)
    end

    def create_path!
      FileUtils.mkpath(path)
    end

    def create_file!
      File.open(file_path, "w+") { |f| f.write(mail.to_s) }
    end

    def open_file!
      Launchy.open(file_path)
    end
  end
end

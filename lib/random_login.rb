class RandomLogin

  def self.generate
    logins = YAML.load_file("#{Rails.root}/config/logins.yml")

    result = nil
    (1..100).each do
      result = logins.sample
      break unless User.where(login: result).exists?
    end
    result
  end

end

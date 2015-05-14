module Utility
  def self.save_and_get_remote_resource(resource_url, resource_title, target_path)
    filename = "#{resource_title.parameterize}#{File.extname(resource_url).downcase}"
    path = File.join(target_path, filename)
    if !File.exists?(path)
      pp "Saving #{resource_url}"
      resp = Net::HTTP.get(URI(resource_url))
      File.open(path, "wb") { |file| file.write(resp) }
    end

    return File.open(path)
  end

  # Creates an Editor
  def self.create_editor(name, email, password)
    editor = User.new(
      email: email,
      name: name,
      password: password,
    )

    editor.save!

    return editor
  end
end
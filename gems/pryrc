Pry.config.hooks.add_hook :when_started, :configure_editor do |out, target, pry|
  pry.config.editor = lambda do |file, line, blocking|
    "atom #{'-w' if blocking} #{file}#{":"+line.to_s if line}"
  end
end

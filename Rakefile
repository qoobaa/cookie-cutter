require "rake/clean"

PATHS = FileList["path-*.svg"]

rule '.3mf' => ['.svg'] do |t|
  sh %Q{openscad -o #{t.name} -D 'shape=\"#{t.source}\"' cutter.scad}
end

desc "split paths"
task :split_paths do
  svg = File.open("drawing.svg").read

  svg.lines.filter { |line| line =~ /path/ }.each.with_index do |path, i|
    File.open("path-#{i}.svg", "w") { |file| file.write("<svg>#{path.chomp.strip}</svg>") }
  end
end

desc "build models"
task :build => PATHS.ext("3mf")

CLOBBER.include(%w(3mf svg).collect { |e| PATHS.ext(e) })
CLEAN.include(%w(3mf).collect { |e| PATHS.ext(e) })

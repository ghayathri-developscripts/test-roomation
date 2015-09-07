desc "annotate AR modes"
task :annotate do
  system "annotate --exclude tests,fixtures -p after"
end

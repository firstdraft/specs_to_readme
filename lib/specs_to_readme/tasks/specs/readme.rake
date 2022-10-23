namespace :specs do
  desc "Adds rspec test descriptions to list in README."
  task :readme do
    `bundle exec rspec --order default --require spec_helper --format documentation --no-color --out specs.md`
    specs = File.open("specs.md").read

    new_spec_content = specs.gsub(/Failures:(.|\n)*/, "").gsub(/\(FAILED - \d+\)/, "</li>")
    new_spec_content = new_spec_content.gsub(/$\n^\s\s/, " ")
    new_spec_content = new_spec_content.gsub(/^(?!\n)/, "<li>")

    top = <<~HEREDOC
    <details>
      <summary>Click here to see names of each test</summary>
    HEREDOC
    readme = File.open("README.md", "a")
    readme.write("\n")
    readme.write("## Specs")
    readme.write("\n")
    readme.write(top)
    readme.write(new_spec_content)
    readme.write("</details>")
    readme.close

    File.delete("specs.md")
  end
end

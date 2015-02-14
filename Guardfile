guard :shell do
  watch(%r{markdown/.*\.md}) {|m| puts "#{m} changed, run 'ruby converter.rb'" ; `ruby converter.rb ; echo 'done'` }
end

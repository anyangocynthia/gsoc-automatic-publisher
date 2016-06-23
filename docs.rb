#!/usr/bin/env ruby
require 'pandoc-ruby'
require 'asciidoctor'

# gets all folders
def get_folders
 Dir.entries(".").select {|entry| File.directory? File.join(".",entry ) and !(entry =="." || entry == "..") }
end

# selects folders with plugins
def plugins
  get_folders.select {|entry| entry.match(/plugin/)}
end

# gets documentation files in the folders
def get_docs
	c = File.open("index.adoc", "w")
	get_folders = plugins
	get_folders.each do |folder|
		# Dir.glob.select('./' + folder + '/*plugin') do |adoc|
		Dir.glob('./' + folder + '/*.adoc' || './' + folder + '/*.md' ) do |adoc|
			puts adoc
			puts %(adoc\n=============)
			f = File.open(adoc, "r") 
				f.each_line do |line|
					c.write line						
					end
				end
			end 
		# end
			puts '============='


Asciidoctor.convert_file 'index.adoc', to_file: true, safe: :safe
end

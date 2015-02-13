require 'kramdown'
require 'nokogiri'
require 'pry'

def content_tag name, content, options = {}
  attributes = options.inject(""){|memo, (k,v)|
    memo << "#{k}='#{v}'"
    memo
  }
  "<#{name} #{attributes}>#{content}</#{name}>"
end

def doc_for(content)
  html = content
  Nokogiri::HTML::DocumentFragment.parse(html)
end

def toc_link(heading)
  heading_id = heading[:id] || "#"
  content_tag(:a, heading.text, href: "#" + heading_id)
end

def toc_item(heading)
  content_tag(:li, toc_link(heading))
end

def heading_nodes(content, element_type = 'h2')
  doc_for(content).css(element_type)
end

def table_of_contents(content)
  list = heading_nodes(content).map do |heading|
    toc_item(heading)
  end.join
  content_tag(:ul, list, class: "list-unstyled")
end

row_identifier = "--- row ---"
col_identifier = "||| col |||"

row_begin_tag = "<div class='row'>"
row_end_tag   = "</div>"
sidebar_text_begin_tag = "<div class='col-xs-12 col-sm-6 sidebar-text'>"
sidebar_text_end_tag   = "</div>"
sidebar_code_begin_tag = "<div class='col-xs-12 col-sm-6 sidebar-code'>"
sidebar_code_end_tag   = "</div>"

list_of_resources = {}

files = File.join "markdown", "*"
Dir.glob(files).each{|input_filename|

  basename = File.basename input_filename, ".md"
  output_filename = basename + ".html"

  text = File.read(input_filename)

  ary_of_rows = text.split(row_identifier)

  ary_of_rows_transformed = ary_of_rows.map{|row|

    ary_of_cols = row.split(col_identifier)

    row_transformed = ""
    row_transformed << sidebar_text_begin_tag
    row_transformed << Kramdown::Document.new(ary_of_cols.first).to_html
    row_transformed << sidebar_text_end_tag

    if ary_of_cols.size > 1
      row_transformed << sidebar_code_begin_tag
      row_transformed << Kramdown::Document.new(ary_of_cols.last).to_html
      row_transformed << sidebar_code_end_tag
    end

    row_transformed
  }

  text_transformed = row_begin_tag + ary_of_rows_transformed.join(row_end_tag + row_begin_tag) + row_end_tag

  File.open("_includes/#{basename}_toc.html", "w+") do |f|
    f.puts table_of_contents(text_transformed)
  end

  unless basename == "index"
    resource_name = heading_nodes(text_transformed, 'h1').first.text
    list_of_resources[resource_name] = output_filename
  end

  File.open(output_filename, "w+") do |f|
    f.puts '---'
    f.puts 'layout: default'
    f.puts '---'
    f.puts ''
    f.puts text_transformed
  end
}

File.open("_includes/list_of_resources.html", "w+") do |f|
  list_of_resources.each{|resource_name, output_filename|
    f.puts "<li><a href='#{output_filename}'>#{resource_name}</a></li>"
  }
end

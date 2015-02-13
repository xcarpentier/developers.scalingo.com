require 'kramdown'
require 'pry'

row_identifier = "--- row ---"
col_identifier = "||| col |||"

row_begin_tag = "<div class='row'>"
row_end_tag   = "</div>"
sidebar_text_begin_tag = "<div class='col-xs-12 col-sm-6 sidebar-text'>"
sidebar_text_end_tag   = "</div>"
sidebar_code_begin_tag = "<div class='col-xs-12 col-sm-6 sidebar-code'>"
sidebar_code_end_tag   = "</div>"

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

  File.open(output_filename, "w+") do |f|
    f.puts '---'
    f.puts 'layout: default'
    f.puts '---'
    f.puts ''
    f.puts text_transformed
  end
}

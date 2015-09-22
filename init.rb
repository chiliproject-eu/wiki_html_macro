Redmine::Plugin.register :wiki_html_macro do
  name 'Wiki Html Macro plugin'
  author 'ChiliProject.eu'
  description 'Adds html wiki macro that renders content passed to it as html, useful for adding arbitrary html code to wiki'
  version '0.0.1'
  url 'http://www.chiliproject.eu/projects/chiliproject-eu/wiki/Wiki_HTML_Macro_Plugin'
  author_url 'http://www.chiliproject.eu'

  Redmine::WikiFormatting::Macros.register do
    desc "Insert html\n\n  !{{html\n<HTML CODE HERE>\n}}"
    macro :html do |obj, args, text|
      text.html_safe
    end
  end
end

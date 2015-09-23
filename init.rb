Redmine::Plugin.register :wiki_html_macro do
  name 'Wiki Html Macro plugin'
  author 'ChiliProject.eu'
  description 'Adds html wiki macro that renders content passed to it as html, useful for adding arbitrary html code to wiki'
  version '0.0.1'
  url 'http://www.chiliproject.eu/projects/chiliproject-eu/wiki/Wiki_HTML_Macro_Plugin'
  author_url 'http://www.chiliproject.eu'

  permission :use_html_macro, {}

  Redmine::WikiFormatting::Macros.register do
    desc "Insert html\n\n  !{{html\n<HTML CODE HERE>\n}}"
    macro :html do |obj, args, text|
      if obj.respond_to?(:author) && obj.author.present? &&
        (obj.author.admin? || obj.author.allowed_to?(:use_html_macro, obj.try(:project)))

        text.html_safe
      elsif obj.respond_to?(:user) && obj.user.present? &&
        (obj.user.admin? || obj.user.allowed_to?(:use_html_macro, obj.try(:project)))

        text.html_safe
      else
        "ERROR: HTML content macro not allowed: #{text}"
      end
    end
  end
end

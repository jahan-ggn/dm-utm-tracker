# frozen_string_literal: true

# name: dm-utm-tracker
# about: Automatically appends UTM parameters to Daily Maverick article links for tracking
# version: 0.0.1
# authors: Jahan Gagan
# url: https://github.com/jahan-ggn/dm-utm-tracker

enabled_site_setting :dm_utm_tracker_enabled

module ::DmUtmTracker
  PLUGIN_NAME = "dm-utm-tracker"
end

require_relative "lib/dm_utm_tracker/engine"

after_initialize do
  DiscourseEvent.on(:before_post_process_cooked) do |doc, post|
    next unless SiteSetting.dm_utm_tracker_enabled

    match_pattern = SiteSetting.dm_utm_match_pattern.strip
    utm_source = SiteSetting.dm_utm_source.strip
    utm_medium = SiteSetting.dm_utm_medium.strip

    doc.css("a").each do |a|
      href = a["href"]

      next unless href&.include?(match_pattern)
      next if href.include?("utm_source=#{utm_source}")

      glue = href.include?("?") ? "&" : "?"

      params = "utm_source=#{CGI.escape(utm_source)}"
      params += "&utm_medium=#{CGI.escape(utm_medium)}" unless utm_medium.empty?

      a["href"] = "#{href}#{glue}#{params}"
    end
  end
end

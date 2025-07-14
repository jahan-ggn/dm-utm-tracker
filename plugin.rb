# frozen_string_literal: true

# name: dm-utm-tracker
# about: TODO
# meta_topic_id: TODO
# version: 0.0.1
# authors: Discourse
# url: TODO
# required_version: 2.7.0

enabled_site_setting :dm_utm_tracker_enabled

module ::DmUtmTracker
  PLUGIN_NAME = "dm-utm-tracker"
end

require_relative "lib/dm_utm_tracker/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end

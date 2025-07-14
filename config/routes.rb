# frozen_string_literal: true

DmUtmTracker::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::DmUtmTracker::Engine, at: "dm-utm-tracker" }

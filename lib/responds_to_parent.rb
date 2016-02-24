require 'responds_to_parent/action_controller'
require 'responds_to_parent/selector_assertion'

ActionController::Base.send :include, RespondsToParent::ActionController

base = if ActionPack::VERSION::MAJOR >= 4
  require "active_support/testing/assertions"
  ActiveSupport::Testing::Assertions
elsif ActionPack::VERSION::MAJOR == 3
  ActionDispatch::Assertions::SelectorAssertions
else
  ActionController::Assertions::SelectorAssertions
end
base.send :include, RespondsToParent::SelectorAssertion

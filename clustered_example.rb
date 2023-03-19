# frozen_string_literal: true

require 'rubernetes'

# Create a new operator that handlle the events callbacks
# @param crd_group [string] ApiGroup from crd
# @param crd_version [string] ApiVersion from crd
# @param crd_plural [string] Name (plural) from crd
# @param options [Hash] Additional options
class CustomOperatorController < Rubernetes::Operator
  def initialize(crd_group, crd_version, crd_plural, options = {})
    super(crd_group, crd_version, crd_plural, options)
  end

  # Event callback when a custom resource is added, you
  # can add your cutom logic here that will be triggered when a custom resource is added
  # @param event [Hash] Event from the watcher that contains
  # all information about the custom resource that you will need
  def added(event)
    @logger.info 'new custom resource has been added on the cluster'
    # custom logic to handle the creation of a custom resource

    # example of how to set and get the status of a custom resource
    set_status(event, { foo: 'foo', bar: 'bar' })
    # @status = get_status(event)
  end

  # Event callback when a custom resource is modified,
  # you can add your cutom logic here that will be triggered when a custom resource is modified
  # @param event [Hash] Event from the watcher
  # that contains all information about the custom resource that you will need
  def modified(event)
    @logger.info 'a custom resource has been modified on the cluster'
    # custom logic to handle the modification of a custom resource

    @logger.info event
  end

  # Event callback when a custom resource is deleted,
  # you can add your cutom logic here that will be triggered when a custom resource is deleted
  # @param event [Hash] Event from the watcher that contains all information about
  #  the custom resource that you will need
  def deleted(_event)
    @logger.info 'a custom resource has been deleted from the cluster'
    # custom logic to handle the deletion of a custom resource
  end
end
CustomOperatorController.new('baz.qux', 'v1', 'operators', {}).run

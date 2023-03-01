# frozen_string_literal: true

require 'rubernetes'

# Create a new operator that handlle the events callbacks
class CustomOperatorController < Rubernetes::Operator
  def initialize(crd_group, crd_version, crd_plural, options = {})
    super(crd_group, crd_version, crd_plural, options)
  end

  def added(event)
    puts 'new custom resource has been added on the cluster'
    # custom logic to handle the creation of a custom resource

    # example of how to set and get the status of a custom resource
    set_status(event, { foo: 'foo', bar: 'bar' })
    # @status = get_status(event)
  end

  def modified(event)
    puts 'a custom resource has been modified on the cluster'
    # custom logic to handle the modification of a custom resource

    puts event

  end

  def deleted(_event)
    puts 'a custom resource has been deleted from the cluster'
    # custom logic to handle the deletion of a custom resource
  end
end

CustomOperatorController.new('baz.qux', 'v1', 'operators', {:namespace => 'default'}).run

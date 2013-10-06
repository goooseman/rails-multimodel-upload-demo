require 'active_model'
require 'active_support/concern'
require 'paperclip/validators/attachment_content_type_validator'
require 'paperclip/validators/attachment_presence_validator'
require 'paperclip/validators/attachment_size_validator'

module Paperclip
  module Validators
    extend ActiveSupport::Concern

    included do
      extend  HelperMethods
      include HelperMethods
    end

    module ClassMethods
      # This method is a shortcut to validator classes that is in
      # "Attachment...Validator" format. It is almost the same thing as the
      # +validates+ method that shipped with Rails, but this is customized to
      # be using with attachment validators. This is helpful when you're using
      # multiple attachment validators on a single attachment.
      #
      # Example of using the validator:
      #
      #   validates_attachment :avatar, :presence => true,
      #      :content_type => { :content_type => "image/jpg" },
      #      :size => { :in => 0..10.kilobytes }
      #
      def validates_attachment(*attributes)
        options = attributes.extract_options!.dup

        Paperclip::Validators.constants.each do |constant|
          if constant.to_s =~ /^Attachment(.+)Validator$/
            validator_kind = $1.underscore.to_sym

            if options.has_key?(validator_kind)
              validator_options = options.delete(validator_kind)
              validator_options = {} if validator_options == true
              local_options = attributes + [validator_options]
              send(:"validates_attachment_#{validator_kind}", *local_options)
            end
          end
        end
      end

      def validate_before_processing(validator_class, options)
        options = options.dup
        attributes = options.delete(:attributes)
        attributes.each do |attribute|
          options[:attributes] = [attribute]
          create_validating_before_filter(attribute, validator_class, options)
        end
      end

      def create_validating_before_filter(attribute, validator_class, options)
        if_clause = options.delete(:if)
        unless_clause = options.delete(:unless)
        send(:"before_#{attribute}_post_process", :if => if_clause, :unless => unless_clause) do |*args|
          validator_class.new(options.dup).validate(self)
        end
      end

    end
  end
end

=begin
#NSX-T Manager API

#VMware NSX-T Manager REST API

OpenAPI spec version: 2.3.0.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require 'date'

module NSXT
  # Configuration for taking manual/automated backup
  class BackupConfiguration
    # Set when backups should be taken - on a weekly schedule or at regular intervals.
    attr_accessor :backup_schedule

    # The server to which backups will be sent.
    attr_accessor :remote_file_server

    # Passphrase used to encrypt backup files.
    attr_accessor :passphrase

    # true if automated backup is enabled
    attr_accessor :backup_enabled

    # The minimum number of seconds between each upload of the inventory summary to backup server.
    attr_accessor :inventory_summary_interval


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'backup_schedule' => :'backup_schedule',
        :'remote_file_server' => :'remote_file_server',
        :'passphrase' => :'passphrase',
        :'backup_enabled' => :'backup_enabled',
        :'inventory_summary_interval' => :'inventory_summary_interval'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'backup_schedule' => :'BackupSchedule',
        :'remote_file_server' => :'RemoteFileServer',
        :'passphrase' => :'String',
        :'backup_enabled' => :'BOOLEAN',
        :'inventory_summary_interval' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'backup_schedule')
        self.backup_schedule = attributes[:'backup_schedule']
      end

      if attributes.has_key?(:'remote_file_server')
        self.remote_file_server = attributes[:'remote_file_server']
      end

      if attributes.has_key?(:'passphrase')
        self.passphrase = attributes[:'passphrase']
      end

      if attributes.has_key?(:'backup_enabled')
        self.backup_enabled = attributes[:'backup_enabled']
      else
        self.backup_enabled = false
      end

      if attributes.has_key?(:'inventory_summary_interval')
        self.inventory_summary_interval = attributes[:'inventory_summary_interval']
      else
        self.inventory_summary_interval = 300
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @remote_file_server.nil?
        invalid_properties.push("invalid value for 'remote_file_server', remote_file_server cannot be nil.")
      end

      if !@inventory_summary_interval.nil? && @inventory_summary_interval > 3600
        invalid_properties.push("invalid value for 'inventory_summary_interval', must be smaller than or equal to 3600.")
      end

      if !@inventory_summary_interval.nil? && @inventory_summary_interval < 30
        invalid_properties.push("invalid value for 'inventory_summary_interval', must be greater than or equal to 30.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @remote_file_server.nil?
      return false if !@inventory_summary_interval.nil? && @inventory_summary_interval > 3600
      return false if !@inventory_summary_interval.nil? && @inventory_summary_interval < 30
      return true
    end

    # Custom attribute writer method with validation
    # @param [Object] inventory_summary_interval Value to be assigned
    def inventory_summary_interval=(inventory_summary_interval)

      if !inventory_summary_interval.nil? && inventory_summary_interval > 3600
        fail ArgumentError, "invalid value for 'inventory_summary_interval', must be smaller than or equal to 3600."
      end

      if !inventory_summary_interval.nil? && inventory_summary_interval < 30
        fail ArgumentError, "invalid value for 'inventory_summary_interval', must be greater than or equal to 30."
      end

      @inventory_summary_interval = inventory_summary_interval
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          backup_schedule == o.backup_schedule &&
          remote_file_server == o.remote_file_server &&
          passphrase == o.passphrase &&
          backup_enabled == o.backup_enabled &&
          inventory_summary_interval == o.inventory_summary_interval
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [backup_schedule, remote_file_server, passphrase, backup_enabled, inventory_summary_interval].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = NSXT.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end

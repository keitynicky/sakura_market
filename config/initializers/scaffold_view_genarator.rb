# http://stackoverflow.com/questions/17153864/rails-scaffold-controller-generator-doesnt-apply-model-attributes-to-views/35122283#35122283

if ARGV.size > 0 and ARGV[0] == "haml:scaffold"
    puts "\n\n\n\n"
    puts "monkey patch attributes at #{Time.now}"

    Rails::Generators::NamedBase.class_eval do

        protected
        def parse_attributes! #:nodoc:
          self.attributes = get_model_attributes if not self.attributes or self.attributes.empty?
          self.attributes = (self.attributes || []).map do |attr|
            Rails::Generators::GeneratedAttribute.parse(attr)
          end
        end

        private
        def get_model_attributes
            begin
                mdl = class_name.to_s.constantize
                attrs = mdl.columns.reject do |a|
                    n = a.name
                    n == "id" or n.end_with? "_id" or n.end_with? == "_type"
                end .map do |a|
                    a.name+":"+mdl.type_for_attribute(a.name).type.to_s
                end
                puts "model_attributes(#{class_name})=#{attrs}"
                return attrs
            rescue => ex
                puts ex
                puts "problem with model #{class_name}"
                return nil
            end
        end

    end

end
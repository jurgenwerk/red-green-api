class ErrorSerializer
  def self.serialize(errors)
    result = errors.messages.map do |message|
      message.last.map do |detail|
        {
          source: { pointer: "/data/attributes/#{message.first}" },
          detail: detail
        }
      end
    end.flatten
    { errors: result }
  end
end

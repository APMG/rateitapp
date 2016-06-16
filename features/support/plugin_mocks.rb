# frozen_string_literal: true

# A mock for a plugin that is always valid.
class SuccessPlugin
  def name
    'song'
  end

  def valid?(_rating)
    true
  end
end

# A mock for a plugin that is always invalid.
class FailurePlugin
  def name
    'song'
  end

  def valid?(_rating)
    false
  end
end

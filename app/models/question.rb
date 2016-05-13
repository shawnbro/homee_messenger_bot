class Question < ActiveRecord::Base
  has_many :question_answer_options
  has_many :answer_options, through: :question_answer_options
  has_many :messages

  scope :unanswered, -> (ids) { where.not('id IN (?)', ids) }
  scope :initial, -> { find_by(ordering: 1) }
  default_scope { order(ordering: :asc) }

  validates :prompt, presence: true, uniqueness: true

  def buttons
    answer_options.map do |opt|
      {
        title: opt.text,
        type: 'postback',
        payload: { question_id: id, answer_option_id: opt.id }.to_json
      }
    end
  end

  def api_elements
    added_title = false
    buttons.each_slice(3).map do |btns|
      {
        title: prompt,
        buttons: btns
      }
    end
  end

  def self.max_ordering
    pluck(:ordering).max
  end
end

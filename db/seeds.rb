questions = [
  {
    prompt: 'Would you like to answer a few questions about your living space?',
    answer_options: ['Yes', 'No'],
    ordering: 1,
  },
  {
    prompt: 'What room can we help you with?',
    answer_options: ['Living Room', 'Bedroom', 'Office', 'Dining Room', 'Outdoor'],
    ordering: 2
  },
  {
    prompt: 'What\'s your budget or price range?',
    answer_options: ['$500 and under', '$500 - $1,000', '$1,000 - $3,000', '$3,000 - $5,000', 'over $5,000'],
    ordering: 3
  },
  {
    prompt: 'When do you need your furniture by ?',
    answer_options: ['0-1 week', '1-2 weeks', '3-4 weeks', '1 month or no timeline'],
    ordering: 4
  },
  {
    prompt: 'How would you describe your style?',
    answer_options: ['Modern', 'Traditional', 'Industrial', 'Eclectic', 'Contemporary'],
    ordering: 5
  },
  {
    prompt: 'Can you send us some pictures of your space?',
    answer_options: [],
    ordering: 6
  },
  {
    prompt: 'Any special requests or additional information?',
    answer_options: [],
    ordering: 7
  }
]

questions.each do |question|
  q = Question.find_or_create_by(prompt: question[:prompt], ordering: question[:ordering])
  question[:answer_options].each do |answer|
    answer_option = AnswerOption.find_or_create_by(
      text: answer
    )
    q.question_answer_options.find_or_create_by(
      answer_option: answer_option
    )
  end
end

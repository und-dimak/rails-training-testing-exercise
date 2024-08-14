require "minitest/autorun"
require_relative "title_check"

class TitleCheckTest < Minitest::Test
  def test_title_follows_sentence_case_standard
    title_checker = TitleCheck.new(title: "There is a test title")
    assert_empty title_checker.warnings
  end

  def test_title_follows_sentence_case_standard_and_includes_allowed_word
    title_checker = TitleCheck.new(title: "There is a Ruby on Rails title")
    assert_empty title_checker.warnings
  end

  def test_title_does_not_follow_sentence_case_standard_and_has_allowed_word
    title_checker = TitleCheck.new(title: "There is a Ruby on Rails Title")
    refute_empty title_checker.warnings
  end

  def test_title_does_not_follow_sentence_case_standard
    title_checker = TitleCheck.new(title: "There is a TEST Title")
    refute_empty title_checker.warnings
  end

  def test_edge_case_with_semicolon
    title_checker = TitleCheck.new(title: "There is a title; There is a description")
    assert_empty title_checker.warnings
  end

  def test_edge_case_with_exclamation
    title_checker = TitleCheck.new(title: "There is a title! There is a description")
    assert_empty title_checker.warnings
  end

  def test_edge_case_with_question_mark
    title_checker = TitleCheck.new(title: "There is a title? There is a description")
    assert_empty title_checker.warnings
  end
end

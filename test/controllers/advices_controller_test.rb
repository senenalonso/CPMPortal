require 'test_helper'

class AdvicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advice = advices(:one)
  end

  test "should get index" do
    get advices_url
    assert_response :success
  end

  test "should get new" do
    get new_advice_url
    assert_response :success
  end

  test "should create advice" do
    assert_difference('Advice.count') do
      post advices_url, params: { advice: { after: @advice.after, before: @advice.before, component_id: @advice.component_id, explanation: @advice.explanation, improvement1: @advice.improvement1, improvement2: @advice.improvement2, improvement3: @advice.improvement3, metric1: @advice.metric1, metric2: @advice.metric2, metric3: @advice.metric3, problem: @advice.problem, unit1: @advice.unit1, unit2: @advice.unit2, unit3: @advice.unit3 } }
    end

    assert_redirected_to advice_url(Advice.last)
  end

  test "should show advice" do
    get advice_url(@advice)
    assert_response :success
  end

  test "should get edit" do
    get edit_advice_url(@advice)
    assert_response :success
  end

  test "should update advice" do
    patch advice_url(@advice), params: { advice: { after: @advice.after, before: @advice.before, component_id: @advice.component_id, explanation: @advice.explanation, improvement1: @advice.improvement1, improvement2: @advice.improvement2, improvement3: @advice.improvement3, metric1: @advice.metric1, metric2: @advice.metric2, metric3: @advice.metric3, problem: @advice.problem, unit1: @advice.unit1, unit2: @advice.unit2, unit3: @advice.unit3 } }
    assert_redirected_to advice_url(@advice)
  end

  test "should destroy advice" do
    assert_difference('Advice.count', -1) do
      delete advice_url(@advice)
    end

    assert_redirected_to advices_url
  end
end

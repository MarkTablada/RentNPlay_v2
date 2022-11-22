require "test_helper"

class ReceiptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receipt = receipts(:one)
  end

  test "should get index" do
    get receipts_url
    assert_response :success
  end

  test "should get new" do
    get new_receipt_url
    assert_response :success
  end

  test "should create receipt" do
    assert_difference("Receipt.count") do
      post receipts_url, params: { receipt: { barangay: @receipt.barangay, city: @receipt.city, end_date: @receipt.end_date, game: @receipt.game, house_number: @receipt.house_number, mobile_number: @receipt.mobile_number, name: @receipt.name, payment_method: @receipt.payment_method, province: @receipt.province, rent_duration: @receipt.rent_duration, rent_rate: @receipt.rent_rate, start_date: @receipt.start_date, sub_total: @receipt.sub_total } }
    end

    assert_redirected_to receipt_url(Receipt.last)
  end

  test "should show receipt" do
    get receipt_url(@receipt)
    assert_response :success
  end

  test "should get edit" do
    get edit_receipt_url(@receipt)
    assert_response :success
  end

  test "should update receipt" do
    patch receipt_url(@receipt), params: { receipt: { barangay: @receipt.barangay, city: @receipt.city, end_date: @receipt.end_date, game: @receipt.game, house_number: @receipt.house_number, mobile_number: @receipt.mobile_number, name: @receipt.name, payment_method: @receipt.payment_method, province: @receipt.province, rent_duration: @receipt.rent_duration, rent_rate: @receipt.rent_rate, start_date: @receipt.start_date, sub_total: @receipt.sub_total } }
    assert_redirected_to receipt_url(@receipt)
  end

  test "should destroy receipt" do
    assert_difference("Receipt.count", -1) do
      delete receipt_url(@receipt)
    end

    assert_redirected_to receipts_url
  end
end

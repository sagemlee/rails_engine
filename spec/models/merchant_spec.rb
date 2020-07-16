require 'rails_helper'

describe Merchant, type: :model do
     describe "relationships" do
    it { should have_many :items}
    it { should have_many :invoices}
    it { should have_many(:invoice_items).through(:invoices)}
  end
end 
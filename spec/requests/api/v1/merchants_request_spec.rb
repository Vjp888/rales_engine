require 'rails_helper'

describe 'Merchants API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants.json'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants["data"].count).to eq(3)
  end

  it 'finds based on given params' do
    create(:merchant, name: 'bob')
    create(:merchant, name: 'joe')
    steve = create(:merchant, name: 'steve')

    get '/api/v1/merchants/find?name=steve'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["id"].to_i).to eq(steve.id)
  end

  it 'finds all based on given params' do
    create(:merchant, name: 'bob')
    create(:merchant, name: 'joe')
    create(:merchant, name: 'steve')

    get '/api/v1/merchants/find_all?name=steve'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant.count).to eq(1)
  end
end

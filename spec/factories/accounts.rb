# frozen_string_literal: true

FactoryBot.define do
  factory :first_testnet_account, class: OpenStruct do
    address { '3My6WVVi1hKfGUqgam4S6nsNYatdeiS6KGT' }
    public_key { 'ERQcJKNkNycgEAFw4GyVhK6by5nWbLqT1kHxxmPd9G2Y' }
    private_key { '4mgeDGcrU1Uqx65zuczLZGDBcTNnbvgBXhiHk19Wuruh' }
    backup_phrase { 'annual code stamp sunset crawl giggle impose gossip script economy prefer camp base code favorite' }
  end

  factory :secound_testnet_account, class: OpenStruct do
    address { '3N7g7JGTdWHx3LEVx19pB9kpDecca87wGk8' }
    public_key { '6HkbA7kSeornUYarAc7NFVi5qQvYfPCyieNWTb7Wccof' }
    private_key { '4H6Z9YogVjN15S67QVf57FAEZypNYjxn9kk3D4Qsx93L' }
    backup_phrase { 'waste outdoor family flag drastic pull arm very million rice bright federal harvest symbol crop' }
  end

  factory :first_mainnet_account, class: OpenStruct do
    address { '3P8ApbdHSyd1iRth5NwPNGfKRR7SQKSSNfK' }
    public_key { 'EcEWzqYqWm27gqAkzCMfVqaJ7vYeAeXMrwX1xz22gFH8' }
    private_key { 'G6xyVidVgCwe5mvs7gr57LDp2dvtZj5EUREwK84e8cnU' }
    backup_phrase { 'image gadget same grant occur mechanic cabbage supply race secret patrol sausage level chalk excess' }
  end
end

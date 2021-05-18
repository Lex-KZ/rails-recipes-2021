class TransactionsController < ApplicationController
    def create
        recipe = Recipe.find params["id"]
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [
               {
                price_data: {
                    unit_amount: 1000,
                    currency: 'usd',
                    product_data: {
                        name: 'Stubborn 1',
                    },
                },
                quantity: 1,
            },
            {
                price_data: {
                    unit_amount: 3000,
                    currency: 'usd',
                    product_data: {
                        name: 'Stubborn 2',
                    },
                },
                quantity: 2,
            },
                {
                price_data: {
                    unit_amount: 3000,
                    currency: 'usd',
                    product_data: {
                        name: 'Stubborn 3',
                    },
                },
                quantity: 3,
            }],
            mode: 'payment',
            success_url: checkout_success_url,
            cancel_url: recipes_url,
        })

        render json: { id: session.id }
    end

    def success
    end
end

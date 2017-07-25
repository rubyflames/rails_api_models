# @ Charles, Rachel

## Just run
1. db:create
2. db:migrate
3. db:seed
4. rails s
5. navigate to users/id

### To access nested objects/properties of user:
Under users_controller, towards the bottom of file,
```ruby
  def set_user
    @user = User.includes(:trips).find(params[:id])
  end
```
**Set**: `.includes(:trips)` between `User` and `find()`

Then in the method `show` (processes queries & params passed in the **url**),  
add:
```ruby
def show
  render :json => @user, :include => {
    :trips => {
      :include => {
        :itineraries => {
          :include => {
            :places => {
              :include => :categories
            }
          }
        }
      }
    }
  }
end
```

## Result:
**URL**: http://localhost:3000/users/2
```json
// 20170726024327
// http://localhost:3000/users/2

{
  "id": 2,
  "name": "Jovil",
  "email": "kilonom@fire.org",
  "password": "abc",
  "created_at": "2017-07-25T18:13:57.088Z",
  "updated_at": "2017-07-25T18:13:57.088Z",
  "trips": [
    {
      "id": 2,
      "duration": 5,
      "pax": 9,
      "budget": 3000.0,
      "user_id": 2,
      "created_at": "2017-07-25T18:13:57.109Z",
      "updated_at": "2017-07-25T18:13:57.109Z",
      "itineraries": [
        {
          "id": 2,
          "trip_id": 2,
          "created_at": "2017-07-25T18:13:57.127Z",
          "updated_at": "2017-07-25T18:13:57.127Z",
          "places": [
            {
              "id": 2,
              "name": "Kamchatka",
              "lat": "56.1327",
              "lng": "159.5314",
              "price_pax": 1500.0,
              "duration": 250,
              "created_at": "2017-07-25T18:13:57.150Z",
              "updated_at": "2017-07-25T18:13:57.150Z",
              "categories": [
                {
                  "id": 2,
                  "name": "adventure",
                  "created_at": "2017-07-25T18:13:57.172Z",
                  "updated_at": "2017-07-25T18:13:57.172Z"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

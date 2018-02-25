survey "Kitchen Sink survey", :display_order=>0 do
  section "Basic questions", :data_export_identifier=>"", :display_order=>0 do

    label "These questions are examples of the basic supported input types", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    q "What is your favorite color?", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>1
    a "red", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "blue", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "green", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a "yellow", :short_text=>nil, :data_export_identifier=>"", :display_order=>3

    a :other, :short_text=>nil, :data_export_identifier=>"", :display_order=>4


    q_2 "Choose the colors you don't like", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>2
    a_1 "red", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a_2 "blue", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a_3 "green", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a_4 "yellow", :short_text=>nil, :data_export_identifier=>"", :display_order=>3

    a :omit, :short_text=>nil, :data_export_identifier=>"", :display_order=>4


    q_2a "Please explain why you don't like this color?", :short_text=>nil, :data_export_identifier=>"", :display_order=>3
    a_1 "explanation", :text, :short_text=>nil, :help_text=>"Please give an explanation for each color you don't like", :data_export_identifier=>"", :display_order=>0

    dependency :rule=>"A or B or C or D"
    condition_A :q_2, "==", {:answer_reference=>"1"}
    condition_B :q_2, "==", {:answer_reference=>"2"}
    condition_C :q_2, "==", {:answer_reference=>"3"}
    condition_D :q_2, "==", {:answer_reference=>"4"}

    q_2b "Please explain why you dislike so many colors?", :short_text=>nil, :data_export_identifier=>"", :display_order=>4
    a_1 "explanation", :text, :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    dependency :rule=>"Z"
    condition_Z :q_2, "count>2", {:answer_reference=>""}

    q_montypython3 "What... is your name? (e.g. It is 'Arthur', King of the Britons)", :short_text=>nil, :data_export_identifier=>"", :display_order=>5
    a_1 "String", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"


    q_montypython4 "What... is your quest? (e.g. To seek the Holy Grail)", :short_text=>nil, :data_export_identifier=>"", :display_order=>6
    a_1 "String", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"

    dependency :rule=>"A"
    condition_A :q_montypython3, "==", {:string_value=>"It is 'Arthur', King of the Britons", :answer_reference=>"1"}

    q_montypython5 "What... is the air-speed velocity of an unladen swallow? (e.g. What do you mean? An African or European swallow?)", :short_text=>nil, :data_export_identifier=>"", :display_order=>7
    a_1 "String", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"

    dependency :rule=>"A"
    condition_A :q_montypython4, "==", {:string_value=>"To seek the Holy Grail", :answer_reference=>"1"}

    label "Huh? I-- I don't know that! Auuuuuuuugh!", :short_text=>nil, :data_export_identifier=>"", :display_order=>8
    dependency :rule=>"A"
    condition_A :q_montypython5, "==", {:string_value=>"What do you mean? An African or European swallow?", :answer_reference=>"1"}

    q_cooling_1 "How do you cool your home?", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>9
    a_1 "Fans", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a_2 "Window AC", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a_3 "Central AC", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a_4 "Passive", :short_text=>nil, :data_export_identifier=>"", :display_order=>3


    q_cooling_2 "How much does it cost to run your non-passive cooling solutions? (This question hidden until you respond 'How do you cool your home?')", :short_text=>nil, :data_export_identifier=>"", :display_order=>10
    a_1 "$", :float, :short_text=>nil, :display_order=>0

    dependency :rule=>"A and B"
    condition_A :q_cooling_1, "!=", {:answer_reference=>"4"}
    condition_B :q_cooling_1, "count>0", {:answer_reference=>""}

    label "Please consider passive cooling solutions (This question always shown, unless you respond 'Passive')", :short_text=>nil, :data_export_identifier=>"", :display_order=>11
    dependency :rule=>"A"
    condition_A :q_cooling_1, "!=", {:answer_reference=>"4"}

    q_improv_start "Get me started on an improv sketch", :short_text=>nil, :data_export_identifier=>"i_s", :common_namespace=>"sketch comedy questions", :common_identifier=>"get me started", :display_order=>12
    a "who", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "what", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "where", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>2


    q "How many pets do you own?", :short_text=>nil, :data_export_identifier=>"", :display_order=>13
    a "Integer", :integer, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"

    validation :rule=>"A"
    condition_A ">=", :integer_value=>0

    q "What is your address?", :short_text=>nil, :data_export_identifier=>"", :display_order=>14, :custom_class=>"address"
    a "Text", :text, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :custom_class=>"mapper", :display_type=>"hidden_label"

    validation :rule=>"A"
    condition_A "=~", :regexp=>"[0-9a-zA-z. #]"

    q "Pick your favorite date AND time", :short_text=>nil, :data_export_identifier=>"", :display_order=>15
    a "Datetime", :datetime, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"


    q_time_lunch "What time do you usually take a lunch break?", :short_text=>nil, :data_export_identifier=>"", :display_order=>16
    a_1 "Time", :time, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"


    q "When would you like to meet for dinner?", :short_text=>nil, :data_export_identifier=>"", :display_order=>17
    a "Date", :date, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"


    q "Adjust the slider to reflect your level of awesomeness", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>18, :display_type=>"slider"
    a "1", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "2", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "3", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a "4", :short_text=>nil, :data_export_identifier=>"", :display_order=>3

    a "5", :short_text=>nil, :data_export_identifier=>"", :display_order=>4

    a "6", :short_text=>nil, :data_export_identifier=>"", :display_order=>5

    a "7", :short_text=>nil, :data_export_identifier=>"", :display_order=>6

    a "8", :short_text=>nil, :data_export_identifier=>"", :display_order=>7

    a "9", :short_text=>nil, :data_export_identifier=>"", :display_order=>8

    a "10", :short_text=>nil, :data_export_identifier=>"", :display_order=>9


    q "How much do you like Ruby?", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>19, :display_type=>"slider"
    a "not at all", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "a little", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "some", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a "a lot", :short_text=>nil, :data_export_identifier=>"", :display_order=>3

    a "a ton", :short_text=>nil, :data_export_identifier=>"", :display_order=>4


    q "How much money do you want?", :short_text=>nil, :data_export_identifier=>"", :display_order=>20
    a "$|USD", :float, :short_text=>nil, :data_export_identifier=>"", :display_order=>0


    group "How much oil do you use per day?" do
      q "Quantity", :short_text=>nil, :data_export_identifier=>"", :display_order=>21
      a "Float", :float, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"

      q "Unit", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>22, :display_type=>"dropdown"
      a "Barrels", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

      a "Gallons", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

      a "Quarts", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    end

    q "Choose your Illinois county", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>23, :display_type=>"dropdown"
    a "Adams", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "Alexander", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "Bond", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a "Boone", :short_text=>nil, :data_export_identifier=>"", :display_order=>3

    a "Brown", :short_text=>nil, :data_export_identifier=>"", :display_order=>4

    a "Bureau", :short_text=>nil, :data_export_identifier=>"", :display_order=>5

    a "Calhoun", :short_text=>nil, :data_export_identifier=>"", :display_order=>6

    a "Carroll", :short_text=>nil, :data_export_identifier=>"", :display_order=>7

    a "Cass", :short_text=>nil, :data_export_identifier=>"", :display_order=>8

    a "Champaign", :short_text=>nil, :data_export_identifier=>"", :display_order=>9

    a "Christian", :short_text=>nil, :data_export_identifier=>"", :display_order=>10

    a "Clark", :short_text=>nil, :data_export_identifier=>"", :display_order=>11

    a "Clay", :short_text=>nil, :data_export_identifier=>"", :display_order=>12

    a "Clinton", :short_text=>nil, :data_export_identifier=>"", :display_order=>13

    a "Coles", :short_text=>nil, :data_export_identifier=>"", :display_order=>14

    a "Cook", :short_text=>nil, :data_export_identifier=>"", :display_order=>15

    a "Crawford", :short_text=>nil, :data_export_identifier=>"", :display_order=>16

    a "Cumberland", :short_text=>nil, :data_export_identifier=>"", :display_order=>17

    a "DeKalb", :short_text=>nil, :data_export_identifier=>"", :display_order=>18

    a "De Witt", :short_text=>nil, :data_export_identifier=>"", :display_order=>19

    a "Douglas", :short_text=>nil, :data_export_identifier=>"", :display_order=>20

    a "DuPage", :short_text=>nil, :data_export_identifier=>"", :display_order=>21

    a "Edgar", :short_text=>nil, :data_export_identifier=>"", :display_order=>22

    a "Edwards", :short_text=>nil, :data_export_identifier=>"", :display_order=>23

    a "Effingham", :short_text=>nil, :data_export_identifier=>"", :display_order=>24

    a "Fayette", :short_text=>nil, :data_export_identifier=>"", :display_order=>25

    a "Ford", :short_text=>nil, :data_export_identifier=>"", :display_order=>26

    a "Franklin", :short_text=>nil, :data_export_identifier=>"", :display_order=>27

    a "Fulton", :short_text=>nil, :data_export_identifier=>"", :display_order=>28

    a "Gallatin", :short_text=>nil, :data_export_identifier=>"", :display_order=>29

    a "Greene", :short_text=>nil, :data_export_identifier=>"", :display_order=>30

    a "Grundy", :short_text=>nil, :data_export_identifier=>"", :display_order=>31

    a "Hamilton", :short_text=>nil, :data_export_identifier=>"", :display_order=>32

    a "Hancock", :short_text=>nil, :data_export_identifier=>"", :display_order=>33

    a "Hardin", :short_text=>nil, :data_export_identifier=>"", :display_order=>34

    a "Henderson", :short_text=>nil, :data_export_identifier=>"", :display_order=>35

    a "Henry", :short_text=>nil, :data_export_identifier=>"", :display_order=>36

    a "Iroquois", :short_text=>nil, :data_export_identifier=>"", :display_order=>37

    a "Jackson", :short_text=>nil, :data_export_identifier=>"", :display_order=>38

    a "Jasper", :short_text=>nil, :data_export_identifier=>"", :display_order=>39

    a "Jefferson", :short_text=>nil, :data_export_identifier=>"", :display_order=>40

    a "Jersey", :short_text=>nil, :data_export_identifier=>"", :display_order=>41

    a "Jo Daviess", :short_text=>nil, :data_export_identifier=>"", :display_order=>42

    a "Johnson", :short_text=>nil, :data_export_identifier=>"", :display_order=>43

    a "Kane", :short_text=>nil, :data_export_identifier=>"", :display_order=>44

    a "Kankakee", :short_text=>nil, :data_export_identifier=>"", :display_order=>45

    a "Kendall", :short_text=>nil, :data_export_identifier=>"", :display_order=>46

    a "Knox", :short_text=>nil, :data_export_identifier=>"", :display_order=>47

    a "La Salle", :short_text=>nil, :data_export_identifier=>"", :display_order=>48

    a "Lake", :short_text=>nil, :data_export_identifier=>"", :display_order=>49

    a "Lawrence", :short_text=>nil, :data_export_identifier=>"", :display_order=>50

    a "Lee", :short_text=>nil, :data_export_identifier=>"", :display_order=>51

    a "Livingston", :short_text=>nil, :data_export_identifier=>"", :display_order=>52

    a "Logan", :short_text=>nil, :data_export_identifier=>"", :display_order=>53

    a "Macon", :short_text=>nil, :data_export_identifier=>"", :display_order=>54

    a "Macoupin", :short_text=>nil, :data_export_identifier=>"", :display_order=>55

    a "Madison", :short_text=>nil, :data_export_identifier=>"", :display_order=>56

    a "Marion", :short_text=>nil, :data_export_identifier=>"", :display_order=>57

    a "Marshall", :short_text=>nil, :data_export_identifier=>"", :display_order=>58

    a "Mason", :short_text=>nil, :data_export_identifier=>"", :display_order=>59

    a "Massac", :short_text=>nil, :data_export_identifier=>"", :display_order=>60

    a "McDonough", :short_text=>nil, :data_export_identifier=>"", :display_order=>61

    a "McHenry", :short_text=>nil, :data_export_identifier=>"", :display_order=>62

    a "McLean", :short_text=>nil, :data_export_identifier=>"", :display_order=>63

    a "Menard", :short_text=>nil, :data_export_identifier=>"", :display_order=>64

    a "Mercer", :short_text=>nil, :data_export_identifier=>"", :display_order=>65

    a "Monroe", :short_text=>nil, :data_export_identifier=>"", :display_order=>66

    a "Montgomery", :short_text=>nil, :data_export_identifier=>"", :display_order=>67

    a "Morgan", :short_text=>nil, :data_export_identifier=>"", :display_order=>68

    a "Moultrie", :short_text=>nil, :data_export_identifier=>"", :display_order=>69

    a "Ogle", :short_text=>nil, :data_export_identifier=>"", :display_order=>70

    a "Peoria", :short_text=>nil, :data_export_identifier=>"", :display_order=>71

    a "Perry", :short_text=>nil, :data_export_identifier=>"", :display_order=>72

    a "Piatt", :short_text=>nil, :data_export_identifier=>"", :display_order=>73

    a "Pike", :short_text=>nil, :data_export_identifier=>"", :display_order=>74

    a "Pope", :short_text=>nil, :data_export_identifier=>"", :display_order=>75

    a "Pulaski", :short_text=>nil, :data_export_identifier=>"", :display_order=>76

    a "Putnam", :short_text=>nil, :data_export_identifier=>"", :display_order=>77

    a "Randolph", :short_text=>nil, :data_export_identifier=>"", :display_order=>78

    a "Richland", :short_text=>nil, :data_export_identifier=>"", :display_order=>79

    a "Rock Island", :short_text=>nil, :data_export_identifier=>"", :display_order=>80

    a "Saline", :short_text=>nil, :data_export_identifier=>"", :display_order=>81

    a "Sangamon", :short_text=>nil, :data_export_identifier=>"", :display_order=>82

    a "Schuyler", :short_text=>nil, :data_export_identifier=>"", :display_order=>83

    a "Scott", :short_text=>nil, :data_export_identifier=>"", :display_order=>84

    a "Shelby", :short_text=>nil, :data_export_identifier=>"", :display_order=>85

    a "St. Clair", :short_text=>nil, :data_export_identifier=>"", :display_order=>86

    a "Stark", :short_text=>nil, :data_export_identifier=>"", :display_order=>87

    a "Stephenson", :short_text=>nil, :data_export_identifier=>"", :display_order=>88

    a "Tazewell", :short_text=>nil, :data_export_identifier=>"", :display_order=>89

    a "Union", :short_text=>nil, :data_export_identifier=>"", :display_order=>90

    a "Vermilion", :short_text=>nil, :data_export_identifier=>"", :display_order=>91

    a "Wabash", :short_text=>nil, :data_export_identifier=>"", :display_order=>92

    a "Warren", :short_text=>nil, :data_export_identifier=>"", :display_order=>93

    a "Washington", :short_text=>nil, :data_export_identifier=>"", :display_order=>94

    a "Wayne", :short_text=>nil, :data_export_identifier=>"", :display_order=>95

    a "White", :short_text=>nil, :data_export_identifier=>"", :display_order=>96

    a "Whiteside", :short_text=>nil, :data_export_identifier=>"", :display_order=>97

    a "Will", :short_text=>nil, :data_export_identifier=>"", :display_order=>98

    a "Williamson", :short_text=>nil, :data_export_identifier=>"", :display_order=>99

    a "Winnebago", :short_text=>nil, :data_export_identifier=>"", :display_order=>100

    a "Woodford", :short_text=>nil, :data_export_identifier=>"", :display_order=>101


    q "Choose your favorite meats", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>24, :display_type=>"inline"
    a "Chicken", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "Pork", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "Beef", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a "Shellfish", :short_text=>nil, :data_export_identifier=>"", :display_order=>3

    a "Fish", :short_text=>nil, :data_export_identifier=>"", :display_order=>4

    a "I don't eat meats!!!", :short_text=>nil, :data_export_identifier=>"", :display_order=>5, :is_exclusive=>true


    q "All out of ideas for questions?", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>25, :display_type=>"inline"
    a "yes", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "maybe", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "no", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a "I don't know", :short_text=>nil, :data_export_identifier=>"", :display_order=>3

  end
  section "Complicated questions", :data_export_identifier=>"", :display_order=>1 do

    grid "Tell us how often do you cover these each day" do
      a "1", :data_export_identifier=>"", :display_order=>0

      a "2", :data_export_identifier=>"", :display_order=>1

      a "3", :data_export_identifier=>"", :display_order=>2

      q "Head", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>0
      q "Knees", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>1
      q "Toes", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>2
    end

    grid "Tell us how you feel today day" do
      a "-2", :data_export_identifier=>"", :display_order=>0

      a "-1", :data_export_identifier=>"", :display_order=>1

      a "0", :data_export_identifier=>"", :display_order=>2

      a "1", :data_export_identifier=>"", :display_order=>3

      a "2", :data_export_identifier=>"", :display_order=>4

      q "down|up", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>3
      q "sad|happy", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>4
      q "limp|perky", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>5
    end

    grid "For each of the car types checked, what type of options would you prefer?" do
      a "Leather seats", :data_export_identifier=>"", :display_order=>0

      a "Shiny rims", :data_export_identifier=>"", :display_order=>1

      a "Subwoofer", :data_export_identifier=>"", :display_order=>2

      a "Sunroof", :data_export_identifier=>"", :display_order=>3

      a "Turbocharger", :data_export_identifier=>"", :display_order=>4

      q "SUV", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>6
      q "Sedan", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>7
      q "Coupe", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>8
      q "Convertible", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>9
      q "Minivan", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>10
      q "Crossover", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>11
      q "Wagon", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>12
      q "Other", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>13
    end

    q "Please rank the following foods based on how much you like them", :short_text=>nil, :data_export_identifier=>"", :display_order=>14
    a "|pizza", :integer, :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "|salad", :integer, :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "|sushi", :integer, :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a "|ice cream", :integer, :short_text=>nil, :data_export_identifier=>"", :display_order=>3

    a "|breakfast ceral", :integer, :short_text=>nil, :data_export_identifier=>"", :display_order=>4


    q "Choose your favorite utensils and enter frequency of use (daily, weekly, monthly, etc...)", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>15
    a "spoon", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "fork", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    a "knife", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>2

    a :other, :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>3


    q "What is your birth date?", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>16
    a "I was born on", :date, :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "Refused", :short_text=>nil, :data_export_identifier=>"", :display_order=>1


    q "At what time were you born?", :short_text=>nil, :pick=>"any", :data_export_identifier=>"", :display_order=>17
    a "I was born at", :time, :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a "This time is approximate", :short_text=>nil, :data_export_identifier=>"", :display_order=>1


    q "When would you like to schedule your next appointment?", :short_text=>nil, :data_export_identifier=>"", :display_order=>18
    a "Datetime", :datetime, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"


    q_car "Do you own a car?", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>19
    a_y "Yes", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

    a_n "No", :short_text=>nil, :data_export_identifier=>"", :display_order=>1


    repeater "Tell us about the cars you own" do
      q "Make", :short_text=>nil, :pick=>"one", :data_export_identifier=>"", :display_order=>20, :display_type=>"dropdown"
      a "Toyota", :short_text=>nil, :data_export_identifier=>"", :display_order=>0

      a "Ford", :short_text=>nil, :data_export_identifier=>"", :display_order=>1

      a "GMChevy", :short_text=>nil, :data_export_identifier=>"", :display_order=>2

      a "Ferrari", :short_text=>nil, :data_export_identifier=>"", :display_order=>3

      a "Tesla", :short_text=>nil, :data_export_identifier=>"", :display_order=>4

      a "Honda", :short_text=>nil, :data_export_identifier=>"", :display_order=>5

      a "Other weak brand", :short_text=>nil, :data_export_identifier=>"", :display_order=>6

      q "Model", :short_text=>nil, :data_export_identifier=>"", :display_order=>21
      a "String", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"

      q "Year", :short_text=>nil, :data_export_identifier=>"", :display_order=>22
      a "String", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>0, :display_type=>"hidden_label"

    end

    repeater "Tell us the name and age of your siblings" do
      q "Sibling", :short_text=>nil, :data_export_identifier=>"", :display_order=>23
      a "Name", :string, :short_text=>nil, :data_export_identifier=>"", :display_order=>0

      a "Age|years", :integer, :short_text=>nil, :data_export_identifier=>"", :display_order=>1

    end
  end
end

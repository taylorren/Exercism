#include "lasagna_master.h"
#include <algorithm>

namespace lasagna_master {
    int preparationTime(vector<string> layers, int avg_time)
    {
        return avg_time*layers.size();

    }

    amount quantities(vector<string> layers)
    {
        amount a{0,0};
        for(auto l:layers)
        {
            if(l=="noodles")
            {
                a.noodles+=50;
            }
            else if(l=="sauce")
            {
                a.sauce+=0.2;
            }
        }
        return a;
    }

    void addSecretIngredient(vector<string> &myList, string secret)
    {
        myList.back()=secret;
    }
    void addSecretIngredient(vector<string> &myList, vector<string> fList)
    {
        myList.back()=fList.back();
    }
    vector<double> scaleRecipe(vector<double> ingredients, int portions)
    {
        transform(ingredients.cbegin(), ingredients.cend(), ingredients.begin(), 
        [portions](double a)
        {
            return a*portions/2.;
        });

        return ingredients;
    }

}  // namespace lasagna_master

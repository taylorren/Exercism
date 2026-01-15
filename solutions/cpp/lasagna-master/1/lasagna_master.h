#pragma once

#ifndef lasagna_master_h
#define lasagna_master_h

#include <vector>
#include <string>

using namespace std;

namespace lasagna_master {

    struct amount {
        int noodles;
        double sauce;
    };

    int preparationTime(vector<string>, int = 2);
    amount quantities(vector<string>);
    void addSecretIngredient(vector<string> &, string);
    void addSecretIngredient(vector<string> &, vector<string>);
    vector<double> scaleRecipe(vector<double>, int);
}  // namespace lasagna_master

#endif

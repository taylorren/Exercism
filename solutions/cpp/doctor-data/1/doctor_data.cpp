#include "doctor_data.h"

namespace heaven
{
    Vessel::Vessel(std::string name, int gen, star_map::System sys)
    {
        this->name=name;
        this->generation=gen;
        this->current_system=sys;
        busters=0;
    }

    Vessel Vessel::replicate(std::string name) 
    {
        if(name.empty())
        {
            name=this->name;
        }

        Vessel newV;
        newV.name=name;
        newV.generation=generation+1;
        newV.current_system=current_system;
        newV.busters=0;

        return newV;
    }

    void Vessel::make_buster()
    {
        busters++;
    }

    bool Vessel::shoot_buster()
    {
        bool shoot;
        if(busters>0)
        {
            busters--;
            shoot=true;
        }
        else 
        {
            shoot=false;
        }
        return shoot;
    }

    std::string get_older_bob(Vessel v1, Vessel v2)
    {
        return v1.generation<v2.generation?v1.name:v2.name;
    }

    bool in_the_same_system(Vessel v1, Vessel v2)
    {
        return v1.current_system==v2.current_system;
    }

}
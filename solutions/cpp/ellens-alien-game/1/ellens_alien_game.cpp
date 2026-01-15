namespace targets
{
    class Alien
    {
    public:
        int x_coordinate;
        int y_coordinate;

        Alien(int x, int y)
        {
            this->x_coordinate = x;
            this->y_coordinate = y;
            this->health = 3;
        }
        int get_health()
        {
            return this->health;
        }
        bool hit()
        {
            this->health--;
            return true;
        }
        bool is_alive()
        {
            return this->get_health()>0;
        }
        bool teleport(int x, int y)
        {
            this->x_coordinate=x;
            this->y_coordinate=y;
            return true;
        }
        bool collision_detection(Alien a)
        {
            return (a.x_coordinate==this->x_coordinate&&a.y_coordinate==this->y_coordinate);
        }
    private:
        int health;
    };
} // namespace targets
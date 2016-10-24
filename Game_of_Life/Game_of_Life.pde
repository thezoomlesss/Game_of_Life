/*

To do:
  - Randomise the spawn function
  - Check if the cells around function
  - display function

*/

void setup()
{
  size(600,600);
  /*
      Calculating the size of a single sell and making a full array cover the whole screen
  */
  float cell_width = width/ (float)col_no;
  float cell_height = height/ (float)row_no;

  random_board();   // Initializing the board with random spawns
}

int col_no=100, row_no=100;
boolean arr[][]= new boolean[col_no][row_no];
int arr_second[][]= new int[col_no][row_no];


void draw()
{
  
}

void random_board()
{
  
  for(int i=0; i < col_no; i++)
  {
    for(int j=0; j< row_no; j++)
    {
      if(random(0,1) > 0.5f)
      {
        toggle(i,j,true);
      }
    }
  }
}

void toggle(int x, int y, boolean c)
{
  if(c == true)
  {
    arr[x][y]=true;
  }
  else
  {
    arr[x][y]=false;
  }
}
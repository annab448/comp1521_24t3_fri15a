// a.
struct _coord {
    double x;		// 0
    double y;		// 8
};					// 16

// b.
typedef struct _node Node;
struct _node {
    int value;
    Node *next;
};			

// c.
struct _enrolment {
    int stu_id; 		// 0
    char course[9]: 	// 4
    char term[5];  		// 13
    char grade[3];
    double mark; 
				
};

//d.
struct _queue {
    int nitems;
    int head; 
    int tail;
    int maxitems;  
    Item *items;  
};

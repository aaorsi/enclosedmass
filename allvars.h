
#define Pi 3.141592654                                                           
#define MIN(a,b) ((a)<(b)?(a):(b))                                                    
#define MAX(a,b) ((a)>(b)?(a):(b))                                                   
#define dprinti(expr) printf(#expr " = %d\n", expr)                                  
#define dprintf(expr) printf(#expr " = %f\n", expr)                                  
#define dprints(expr) printf(#expr " = %s\n", expr)                                       
#define SQR(a) ((a)*(a))                                                                  
#define NCELLMAX 207000              
#define NMAX 20618                                                               
#define NMAXDM 2000000
#define NBINMAX 100                                                                       
#define NCHARMAX 255                                                            
                                       
typedef struct {                                                                          
    unsigned long ioc;
	unsigned long id;
float masa; 
    float x;
   	float y;
	float z;
} particle;
                                                                              
extern float CellSize; 
extern int NCells;
extern unsigned int NCellTotal; 
extern int NRunXX, nXX, Seed;
extern float LBox;
extern int LogBins;

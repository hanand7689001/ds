#include<stdio.h>
#include<stdlib.h>
#include<string.h>
struct node
{ 
 int ssn;
 char name[20];
 char desi[20];
 char dept[20];
 int sal;
 char ph[20];
 struct node *llink;
 struct node *rlink;
};
typedef struct node *NODE;
NODE insertfront(NODE first)
{
 NODE temp;
 temp=(NODE)malloc(sizeof(struct node));
 printf("enter employee details");
 printf("\nenter ssn,name,dept,desig,salary,phone no.:\n");
 scanf("%d",&temp->ssn);
 scanf("%s",temp->name);
 scanf("%s",temp->dept);
 scanf("%s",temp->desi);
 scanf("%d",&temp->sal);
 scanf("%s",temp->ph);
 if(first==NULL)
 return temp;
 temp->rlink=first;
 first->llink=temp;
 temp->llink=NULL;
 return temp;
}
NODE insertrear(NODE first)
{
 NODE temp,cur;
 temp=(NODE)malloc(sizeof(struct node));
 printf("\nenter employee details\n");
 printf("\nenter ssn,name,dept,desig,salary,phone no.:\n");
 scanf("%d",&temp->ssn);
 scanf("%s",temp->name);
 scanf("%s",temp->dept);
 scanf("%s",temp->desi);
 scanf("%d",&temp->sal);
 scanf("%s",temp->ph); 
 if(first==NULL)
 return temp;
 cur=first;
 while(cur->rlink!=NULL)
 cur=cur->rlink;
 cur->rlink=temp;
 temp->llink=cur;
 temp->rlink=NULL;
 return first;
}
NODE deletefront(NODE first)
{ 
NODE temp;
if(first==NULL)
{
 printf("\nlist is empty");
 return;
}
if(first->rlink==NULL)
{
 printf("\nemployee details deleted ssn:%d\n",first->ssn);
 free(first);
 return NULL;
}
temp=first->rlink;
temp->llink=NULL;
printf("\nemp details ssn:%d\n",first->ssn);
free(first);
return temp;
}
NODE deleterear(NODE first)
{
 NODE temp,cur;
 if(first==NULL)
 {
 printf("\nempty list\n");
 return;
 }
 if(first->rlink==NULL)
 {
 printf("\nemp details ssn:%d\n",first->ssn);
 free(first);
 return NULL;
 }
 cur=first;
 while(cur->rlink!=NULL)
 cur=cur->rlink;
 temp=cur->llink;
 printf("\nemp details ssn:%d\n",cur->ssn);
 temp->rlink=NULL;
 free(cur);
 return first;
}
void display(NODE first)
{
 NODE cur; int c=0;
 if(first==NULL)
 {
 printf("\nlist is empty\n");
 return;
 }
 cur=first;
 while(cur!=NULL)
 {
 printf("\n%d\n%d\n%s\n%s\n%s\n%s\n",cur->ssn,cur->sal,cur->name,cur-
>dept,cur->desi,cur->ph);
cur=cur->rlink; c++;
 }
 printf("\nno. of emp=%d\n",c);
}
void main()
{
 NODE first;
 int ch;
 first=NULL;
 while(1)
 {
 printf("\n1.insert front\t 2.insert rear\t 3.delete front\n4.delete 
rear\t5.display\t 6.exit");
 printf("\nenter choice:");
 scanf("%d",&ch);
 switch(ch)
 {
 case 1 : first=insertfront(first);
 break;
 case 2 : first=insertrear(first);
 break;
 case 3 : first=deletefront(first);
 break;
 case 4 : first=deleterear(first); 
 break;
 case 5 : display(first);
 break;
 case 6 : exit(0);
 }
 }
} 

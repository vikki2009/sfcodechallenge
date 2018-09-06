import pymysql #using pymysql in order to connect MS SQL Server.


class log_parser:
    
    def __init__(self):
		#database connection parameters, this can be changed to prompt uses for the user and password
	    self.db = pymysql.connect(host='localhost', port=3306, user='root', passwd='Pa55word123', db='shutterfly')
	    self.cur = self.db.cursor()
        #self.db.close()
	
	# TopXSimpleLTVCustomers function is used to calculate LTV values for top X users.
    def TopXSimpleLTVCustomers(self,X):
        LTVsql = 'select * from  customer_LTV limit ' + str(X)
        self.cur.execute(LTVsql)
        output = self.cur.fetchall()
		
		#write output to a results text file. File contains top X user LTV values with other necessary information.
        with open(r"~/output.txt",'w') as file:
            for row in output:
                file.write("%s\n" % str(row))
        file.close()                
        
		
	# This function returns a piece of string from bigger string between two strings (first and last).for example a table name after "type" tag or verb value.
    def find_object( self,s, first, last ):
        try:
			#it provides part of string between first and last location.
            start = s.index( first ) + len( first )
            end = s.index( last, start )
            return s[start:end]
        except ValueError:
            return ""
			
			
	# data ingestion function definition 
    def ingest(self,tab_name,action,colval_pairs):
        tab_name = tab_name.lower() # input table name.
        key = parser.find_object(str(colval_pairs),'"key": "','"') #trying to extract key value from input string.
		# pri_key is a dictionary to keeps primary keys
        pri_key ={'customer':'customer_id','sitevisit':'visit_id','image':'image_id','imageupload':'image_id','orders':'order_id','order':'order_id','site_visit':'visit_id'} 
		#pri key value for a table.
        p_key = pri_key[tab_name]
        
		#replacing key  with primary key value.
        colval_pairs = [w.replace('key', p_key) for w in colval_pairs]
        
        if not(any("NULL" in x for x in colval_pairs)): 
            cols, vals = [], [] # to hold columns and values
            for colval in colval_pairs:
                col, val = colval.split('":') 
                
				#cleaning data
                if col[0] =='"':
                    col = col[1:]
                if val[-1] =='}':
                    val = val[:-1]
                vals.append(val)
                cols.append(col[2:])
                
                #if verb = update -> update columns with value based on primary key. We are not updating primary key with new value.
                if action.lower() in ['update']:
                    if not (str('"'+p_key).strip() == col.strip()): # key not being updated
                        ucolumn = str(col[1:])
                        ucolumn = ucolumn[1:]
                        usql = 'UPDATE '+str(tab_name)+' SET '+ucolumn+'=' + val + ' where '+ p_key + '= "' +key+        '";' # because of time constraints - i couldnt check if row doesnt exists clause here. 
                        self.cur.execute(usql)
                        self.db.commit()
                        
                        
            # inserting new rows in table.
            if action.lower() in ['new','upload']:
                isql = 'insert into '+str(tab_name)+' ('+','.join(cols)+') values ('+','.join(vals)+');'  # Primary key column not updated
                self.cur.execute(isql)
                self.db.commit()
                
            





# This is the main function.

#open input file. I am using input.json in my case.    
f = open("~/input.json",'r')	
f_r = f.readlines()
f.close()
parser = log_parser() # create an object of class.

#remove paranthesis from front and end.
if f_r[0] =='[' or f_r[0]==']' or f_r[-1] =='[' or f_r[-1]==']':
    f_r = f_r[1:-1]
if f_r[0] =='{' or f_r[0]=='}' or f_r[-1] =='{' or f_r[-1]=='}':
    f_r = f_r[1:0]    


    
for line in f_r:
    line = line.split(',')
    tab_name = parser.find_object(str(line),'{"type": "','"') # extracting table name
    action = parser.find_object(str(line),'"verb": "','"') #extracting verb / action .
    parser.ingest(tab_name,action,line[2:-1]) #ingest data. 
	

X = input("Enter How many LTV values are needed? :") # prompting user to provide limit for select.
#Calculate TOP X Simple LTV values
parser.TopXSimpleLTVCustomers(X) 
#Closing DB connection.
parser.db.close()

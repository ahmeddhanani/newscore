import MySQLdb
from crawler import *


if __name__ == '__main__':
    crawlerObj = crawler()
    
    rep = 'Y'
    while rep == 'y' or rep == 'Y':
        print ""
        print "-----------------------------------------------------------------------------"
        print "1. Add New Website"
        print "2. Delete Website"
        print "3. Parse News (Just for Demo)"
        print "4. Parse All News from existing xml(s)"
        print "-----------------------------------------------------------------------------"

        choice = int(raw_input("\t\t\t\tEnter Your Choice\n-----------------------------------------------------------------------------\n"))
        print "-----------------------------------------------------------------------------"
        if choice == 1:
            
            link = raw_input('\t\t\t\tEnter a link\n-----------------------------------------------------------------------------\n')
            crawlerObj.add_web(link)
            
        elif choice == 2:
            link = raw_input('\t\t\t\tEnter a link\n-----------------------------------------------------------------------------\n')
            crawlerObj.delete_web(link)

        elif choice == 3:
            crawlerObj.parse_one('http://rss.cnn.com/rss/edition_sport.rss')

        elif choice == 4:
            crawlerObj.parse_all()
        else:
            print "Bad Choice"

        rep = raw_input("Do You Want to continue? (Y/N)")

print ""
print ""
print "-----------------------------------------------------------------------------"
print "\t\t\tThanks for using our crawler"
print "\t\t\t\tGoodbye :-)"
print "-----------------------------------------------------------------------------"

# AutoLatex #
Edit your paper by structure. 

----
## For Uers ##
### Quick Start ###
1. check: execute checkPlugins.sh to check whether you installed all applications necessary for this tool or not. 

2. make: run make script in AutoLatex directory with assurance that you have the authority, which will help you configurate the path environment. After that, you need to **execute** `source ~/.bashrc` to validate the configuration <u>manually</u>. If you are used to configurate your path environment in other profile, you can open make and modify `file` and `path`. 

3. create: Then you can open your terminal where you want to start your new paper by command `tlt create your_project_name` and the input `y` to ensure you want to create the new project under current directory. If anything is ok, you will see the tree structure of your new project directory

4. design your paper structure in `structure.xml`: different from tex grammer which use cascaded `sub` word to mark the section level, you can name each section, subsection and arbitrary subordinate level of section by the same xml label--`<section></section>` and the level of the section is marked by indent, just like

    ```xml
    <sections name="Documents" id="">
        <section name="Introduction" id="I">
        	<section name="Method" id="A">
            </section>
        </section>
    </sections>
    ```
    
    
    
5. 

    

## For Developers or Anyone Interesting to Source Code ##
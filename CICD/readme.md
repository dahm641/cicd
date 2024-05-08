# What is a CI/CD pipelinee
- Continiuos integration and continous deployment pipeline. It is a series of automated steps that help to deliver new pieces of software/applications at at a fast rate. 
- It automates some stages of the SLDC such as building, testing and deploying code. 
- As soon as a developer finishes a piece of code wheter that be a new feature or bug fix, they can send it through a pipeline which will not only build their code into the main application, but also test it to ensure it works as expected and works with the rest of the main code. 
- Using automation not only speeds up the process, it minimizes human error and is a standard and consistent process.
- Conitinous integration is a fully automated build and test process to ensure what you have developed will work or not
- Continious delivery is when new code gets built, tested and is ready to deploy. It is delivered to you and you hae to **manually* deploy it.
- Continious deployment is where the entire proces is completed for you automatically.

![img_1.png](img_1.png)



## Why
- It allows companies to deliver value to the end customer at a much faster rate
- Improves efficiency of development
- Gives them a competitve edge as they can easily stay up to date on latest technologies and market trends and new features can be added to an application rapidly using a CI/CD pipeline. 
- Enables faster delivery of products and services than competitors
- It has less man hours involved which can save the company time as well - reduced operational costs
- Saves the company money by having lses resources needed for development since the process is automated
- CI provdies immediate feedback so can improve/fix code quicker
- Smaller code segments so also quicker to fix
- Increased velocity
- Better team morale working on iterative changes and seeing them in action


## How
- Using a number of different tools.
- For example, pushing the code to Github, then Jenkins pulling that code to test it and build it and deploy it on AWS EC2 instance.
![img_3.png](img_3.png)
- At each stage we can see if it passes the automation and if not we can change the code so that it works and feed it back into the pipeline
- ![img_2.png](img_2.png)
- We have unit tests to see if the code is good and then integration tests to see if the code works with our app code




## Where
Any time software is being deployed, updates are being made, infrastructure is being changed, security is being added, any time whre some code is written that integrates or adds value to the application, having a pipeline will speed up and reliably deploy that code

# When
It is adopted after the coding stage and automates the process of build, test and deploy so that code being developed can be deployed to the main application seamlessly and without needing human intervention. 


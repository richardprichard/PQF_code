![PAS logo](http://ebmedia.eventbrite.com/s3-build/images/1635885/61546715181/3/logo.png)

Introduction
========================================================

This is the Planning Quality Framework report for Council haringey. It has been run with the sample flag set to TRUE. If this is set to true then all the councils have had their application counts reduced down to the size of the smallest. 
It tells the story of the performance of the council's Planning Service taking account of:
* Facts; real-time data on planning applications.
* Opinion; what customers say about the planning service?
* Development quality: how good is 'what-gets-built'?
The report includes some bar charts, line graphs and boxplots [guide to box plots](http://en.wikipedia.org/wiki/Box_plot). In the line graphs your council is represented by the thicker coloured line and its average is the thick red line. The overall 'trend' is indicated by the thicker, darker grey background.

The report has individual sections which are useful but on their own don't tell the whole story. The real story emerges when different parts of the report are knitted together. For example, how many councils have carried out expensive process reviews as the answer to speeding things up and failing to notice that they say yes more than their peers, create less waste and have happier customers? That is the essence of this report - a much more rounded story of what is happening and what direction things are heading in.

PART 1 - The Planning Service Profile 
========================================================

This shows the different kinds and volumes of development the Planning Service handles, how it receives applications, and the fee income.

1a Application counts
---------------------
*Purpose:* Understanding the volume of applications for each type of development over the last 18 months

![plot of chunk application_pie](figure/application_pie.png) 

*For review:*
* *What is most of the work?*  Usually it's small and householder applications. 
* *Do the volumes look right?* If not, could it be that data is missing? 
* *Do your priorities, processes and practices reflect the variety / volume of the work?* Could you standardise/streamline more of the routine work or ?allocate resources differently? Is project and improvement work targeted at the right things?

1b. Application Counts/ Fee Comparator
---------------------
*Purpose:* To understand how your work and fee income compares with your peers.

This is the count and fee income of applications received, grouped into categories. The colour key is the same as for the pie chart above:

![plot of chunk application_counts](figure/application_counts1.png) ![plot of chunk application_counts](figure/application_counts2.png) 

*For review:*
* *Is your application and/or fee profile very different to your peers?* Is this expected? Are they doing something differently? Are these the right councils to compare with?
* *Are your peers seeing more of a particular type of development than you?*  Again, is this what you'd expect? Is there something happening in other places you could learn from? 
* *Do the applications / fees mix represent any risk?* Does a large proportion fees come from a small number of applications? Are you managing this risk appropriately ?

1c. Applications over time 
---------------------
*Purpose:* To understand how the counts of the various sorts of applications is changing over time

![plot of chunk application_trend](figure/application_trend.png) 

*For review:*
* *Is there a a rise/fall in the numbers of certain development types?* Does this correspond with your fee profile? Have the changes to permitted development had any affect?
* *Are there any surprises/new things happening?* Is the 'market' moving in a particular way?
* *If there is a trend and it continues, how might this affect things?* How will your fee profile change? Is your skills base going to need to change? your fee profile over the next few quarters?
* *Have you 'geared up' / formed teams to do certain types of work?* How might this affect things?

1d. Applications from the Portal
---------------------
*Purpose:* To understand how much work is received via the Planning Portal.Applications that are received via the Portal can often 'behave' differently. This worth keeping in mind, especially when looking at performance later in the report.

![plot of chunk portal](figure/portal.png) 

*For review:*
* *What is the trend?* Is work received rising or falling? 
* *Are you doing anything that might affect the trend?* e.g. an initiative encouraging customers to use the Portal?

1e. Work on hand



PART 2 - Approvals and non-value work
========================================================

Planning is often described as a barrier to development. This part of the report looks at how many and which types of development proposals get approved. It also looks at how much work gets withdrawn and how much additional work results from the original application e.g discharge of conditions.

2a. Approval Rates
------------------

*Purpose:* What types of development are we saying 'yes' to and how often? 

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

This is the same information broken out by development category. 
<table>
 <thead>
  <tr>
   <th align="left"> development category </th>
   <th align="right"> your count </th>
   <th align="left"> your %age </th>
   <th align="right"> their count </th>
   <th align="left"> their %age </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> adverts </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 355 </td>
   <td align="left"> 91% </td>
  </tr>
  <tr>
   <td align="left"> Adverts </td>
   <td align="right"> 46 </td>
   <td align="left"> 89% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> cert </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 19 </td>
   <td align="left"> 72% </td>
  </tr>
  <tr>
   <td align="left"> Conditions </td>
   <td align="right"> 12 </td>
   <td align="left"> 92% </td>
   <td align="right"> 961 </td>
   <td align="left"> 95% </td>
  </tr>
  <tr>
   <td align="left"> heritage </td>
   <td align="right"> 39 </td>
   <td align="left"> 79% </td>
   <td align="right"> 489 </td>
   <td align="left"> 92% </td>
  </tr>
  <tr>
   <td align="left"> householder </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 878 </td>
   <td align="left"> 87% </td>
  </tr>
  <tr>
   <td align="left"> Householder </td>
   <td align="right"> 558 </td>
   <td align="left"> 86% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> MajorMajor </td>
   <td align="right"> 3 </td>
   <td align="left"> 100% </td>
   <td align="right"> 144 </td>
   <td align="left"> 97% </td>
  </tr>
  <tr>
   <td align="left"> Minor </td>
   <td align="right"> 188 </td>
   <td align="left"> 71% </td>
   <td align="right"> 887 </td>
   <td align="left"> 86% </td>
  </tr>
  <tr>
   <td align="left"> MinorMajor </td>
   <td align="right"> 16 </td>
   <td align="left"> 75% </td>
   <td align="right"> 450 </td>
   <td align="left"> 94% </td>
  </tr>
  <tr>
   <td align="left"> NMA </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 241 </td>
   <td align="left"> 99% </td>
  </tr>
  <tr>
   <td align="left"> prior </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 374 </td>
   <td align="left"> 89% </td>
  </tr>
  <tr>
   <td align="left"> Reserved matters </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 168 </td>
   <td align="left"> 94% </td>
  </tr>
  <tr>
   <td align="left"> trees </td>
   <td align="right"> 62 </td>
   <td align="left"> 90% </td>
   <td align="right"> 319 </td>
   <td align="left"> 97% </td>
  </tr>
  <tr>
   <td align="left"> use </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 150 </td>
   <td align="left"> 84% </td>
  </tr>
  <tr>
   <td align="left"> Use </td>
   <td align="right"> 45 </td>
   <td align="left"> 76% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> NA </td>
   <td align="right"> 440 </td>
   <td align="left"> 94% </td>
   <td align="right"> 201 </td>
   <td align="left"> 83% </td>
  </tr>
</tbody>
</table>


JOBTODO
job - count yes's and no's
are there any trends ?


*For review:*
* *What is the overall trend?* Are you granting more permissions? How might these messages be relayed to stakeholders?
* *Is the %age of permissions always a positive?* E.g. are certain types of development always controversial, and you are saying yes to more and more of these? 
* *Do your approval rates differ significantly from your peers on a particular type of development?*  What might be happening elsewhere that you can learn from?  


2b. Withdrawal Rates
------------------
*Purpose:* Rates of withdrawal are a 'waste' indicator. Where possible they should be reduced to near zero. 

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

This is the same information broken out by development category. 
<table>
 <thead>
  <tr>
   <th align="left"> development category </th>
   <th align="right"> your count </th>
   <th align="left"> your %age </th>
   <th align="right"> their count </th>
   <th align="left"> their %age </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> adverts </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 355 </td>
   <td align="left"> 98% </td>
  </tr>
  <tr>
   <td align="left"> Adverts </td>
   <td align="right"> 46 </td>
   <td align="left"> 91% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> cert </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 19 </td>
   <td align="left"> 94% </td>
  </tr>
  <tr>
   <td align="left"> Conditions </td>
   <td align="right"> 12 </td>
   <td align="left"> 83% </td>
   <td align="right"> 961 </td>
   <td align="left"> 99% </td>
  </tr>
  <tr>
   <td align="left"> heritage </td>
   <td align="right"> 39 </td>
   <td align="left"> 87% </td>
   <td align="right"> 489 </td>
   <td align="left"> 94% </td>
  </tr>
  <tr>
   <td align="left"> householder </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 878 </td>
   <td align="left"> 96% </td>
  </tr>
  <tr>
   <td align="left"> Householder </td>
   <td align="right"> 558 </td>
   <td align="left"> 94% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> MajorMajor </td>
   <td align="right"> 3 </td>
   <td align="left"> 100% </td>
   <td align="right"> 144 </td>
   <td align="left"> 99% </td>
  </tr>
  <tr>
   <td align="left"> Minor </td>
   <td align="right"> 188 </td>
   <td align="left"> 88% </td>
   <td align="right"> 887 </td>
   <td align="left"> 92% </td>
  </tr>
  <tr>
   <td align="left"> MinorMajor </td>
   <td align="right"> 16 </td>
   <td align="left"> 88% </td>
   <td align="right"> 450 </td>
   <td align="left"> 99% </td>
  </tr>
  <tr>
   <td align="left"> NMA </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 241 </td>
   <td align="left"> 97% </td>
  </tr>
  <tr>
   <td align="left"> prior </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 374 </td>
   <td align="left"> 98% </td>
  </tr>
  <tr>
   <td align="left"> Reserved matters </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 168 </td>
   <td align="left"> 96% </td>
  </tr>
  <tr>
   <td align="left"> trees </td>
   <td align="right"> 62 </td>
   <td align="left"> 97% </td>
   <td align="right"> 319 </td>
   <td align="left"> 97% </td>
  </tr>
  <tr>
   <td align="left"> use </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 150 </td>
   <td align="left"> 91% </td>
  </tr>
  <tr>
   <td align="left"> Use </td>
   <td align="right"> 45 </td>
   <td align="left"> 84% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> NA </td>
   <td align="right"> 440 </td>
   <td align="left"> 93% </td>
   <td align="right"> 201 </td>
   <td align="left"> 81% </td>
  </tr>
</tbody>
</table>

*For review:*
* *What is the overall trend ?* Are you trying anything to bring rates of withdrawal down? Is it working? Are there particular categories of development that suffer more ?
* What are withdrawn applications costing you?* For most category of applications, the fee does not cover the cost of processing them. A withdrawn application represents cost of processing the application to the point it is withdrawn, and then there is the potential for a 'free go' (see Part 3 - non-heritage zero fee applications). Is there anything to be done ?
* *Why are applications getting withdrawn?* How many occur at the request of the council? What do your developer community think ?

2c. Follow-up applications
-------------------
*Purpose:* In an ideal world, planning authorities issue permissions so that applicants can begin developing. We've identified several categories of application as 'follow-up' which means there is a series of applications for the same development. Many times these are a product of the market (extensions of time, some NMA) and sometimes these are required by the LPA (discharge of conditions)

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

This is the same information broken out by development type. 
<table>
 <thead>
  <tr>
   <th align="left"> development category </th>
   <th align="right"> your count </th>
   <th align="left"> your %age </th>
   <th align="right"> their count </th>
   <th align="left"> their %age </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> adverts </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 355 </td>
   <td align="left"> 100% </td>
  </tr>
  <tr>
   <td align="left"> Adverts </td>
   <td align="right"> 46 </td>
   <td align="left"> 100% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> cert </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 19 </td>
   <td align="left"> 100% </td>
  </tr>
  <tr>
   <td align="left"> Conditions </td>
   <td align="right"> 12 </td>
   <td align="left"> 0% </td>
   <td align="right"> 961 </td>
   <td align="left"> 0% </td>
  </tr>
  <tr>
   <td align="left"> heritage </td>
   <td align="right"> 39 </td>
   <td align="left"> 100% </td>
   <td align="right"> 489 </td>
   <td align="left"> 100% </td>
  </tr>
  <tr>
   <td align="left"> householder </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 878 </td>
   <td align="left"> 98% </td>
  </tr>
  <tr>
   <td align="left"> Householder </td>
   <td align="right"> 558 </td>
   <td align="left"> 100% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> MajorMajor </td>
   <td align="right"> 3 </td>
   <td align="left"> 67% </td>
   <td align="right"> 144 </td>
   <td align="left"> 91% </td>
  </tr>
  <tr>
   <td align="left"> Minor </td>
   <td align="right"> 188 </td>
   <td align="left"> 100% </td>
   <td align="right"> 887 </td>
   <td align="left"> 89% </td>
  </tr>
  <tr>
   <td align="left"> MinorMajor </td>
   <td align="right"> 16 </td>
   <td align="left"> 94% </td>
   <td align="right"> 450 </td>
   <td align="left"> 92% </td>
  </tr>
  <tr>
   <td align="left"> NMA </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 241 </td>
   <td align="left"> 0% </td>
  </tr>
  <tr>
   <td align="left"> prior </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 374 </td>
   <td align="left"> 100% </td>
  </tr>
  <tr>
   <td align="left"> Reserved matters </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 168 </td>
   <td align="left"> 100% </td>
  </tr>
  <tr>
   <td align="left"> trees </td>
   <td align="right"> 62 </td>
   <td align="left"> NaN% </td>
   <td align="right"> 319 </td>
   <td align="left"> 100% </td>
  </tr>
  <tr>
   <td align="left"> use </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 150 </td>
   <td align="left"> 89% </td>
  </tr>
  <tr>
   <td align="left"> Use </td>
   <td align="right"> 45 </td>
   <td align="left"> 100% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> NA </td>
   <td align="right"> 440 </td>
   <td align="left"> 100% </td>
   <td align="right"> 201 </td>
   <td align="left"> 71% </td>
  </tr>
</tbody>
</table>

*For review:*
* *What is the overall trend ?* 
* *These category of applications do not cover the costs of processing them.* Is there anything to be done ?
* *It is likely that more complex developments are more likely to have requirements post decision.* What about the more simple categories ?
* *What do your developer community think ?* There may be a very positive story here that you should share. 

PART 3 - Fees, resources and investment
========================================================

This part of the report looks at the investment value that development proposals represent, and how well matched the resources (FTEs) are to the volumes of work

*Purpose:* The following 3 plots follow the same form. These plots are organised by when the application is received (not determined). 

3(a) Fees received per quarter
-----------------------------

![plot of chunk 3a fees](figure/3a fees.png) 

*For review:*
* *How is the market behaving ?* You already know your income from fees. This plot whows you how other planning departments are faring so you can see whether changes are part of a trend. 

3(b) Headcount estimate
-----------------------------


![plot of chunk 3b FTE](figure/3b FTE.png) 

> The 'FTE estimate' plot is based on PAS 2012 Benchmark data. 

*For review:*
* *How does the FTE estimate compare to reality?* What might account for significant differences? You should compare notes with your peers and help refine our time allowances for each class of application (you can see the values we've used for your report at the end of the technical appendix)
* *What is the overall FTE trend?* Does this correspond with the volumes of applications you are receiving (Section 1)? 
* *What do these numbers tell you about resourcing the department properly ?* Are there opportunities to re-focus resources?

3(c) Investment estimate over time
----------------------------------

![plot of chunk 3c investment](figure/3c investment.png) 
> The 'Investment estimate' plot is based on the build costs for different types of development - these are just PAS estimates for now so are illustrative only. 
> Estimated cost of work means an estimate accepted by the local authority as being a reasonable amount that would be charged by a person in business to carry out such work (as per building control)

*For review:*
* *Development Investment - what are the significant messages?* The investment value will represent a significant ?sum and will put a perspective on many decisions facing the service - each planning consent results in some form of inward investment..
* *What do the trends (rising/falling) mean for your place?* Is there any significance between this and fee income (e.g. considering future resources available)? Is there a significance regarding the FTE estimate (e.g. are you resourced to handle a growing upward trend, might you have to re-focus resources to account for a downward trend)?

3(d) Non-heritage applications zero fee
--------------------------------------

![plot of chunk 3d zerofee](figure/3d zerofee.png) 
*For review:*
* *Why are you receiving applications without a fee for non-heritage applications?* Zero fee applications can follow previous withdrawns.

PART 4 - Time - Validation, Determination
========================================================
This section of the report summarises how long the validation and determination of applications took.


4.1 How much work is valid on day 1 ?
-----------------------------------

*Purpose:* Shows the proportion of applications received that can be worked on straight away.

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 


<table>
 <thead>
  <tr>
   <th align="left"> Development category </th>
   <th align="right"> your count </th>
   <th align="left"> your %age </th>
   <th align="right"> their count </th>
   <th align="left"> their %age </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> adverts </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 355 </td>
   <td align="left"> 55% </td>
  </tr>
  <tr>
   <td align="left"> Adverts </td>
   <td align="right"> 46 </td>
   <td align="left"> 11% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> cert </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 19 </td>
   <td align="left"> 47% </td>
  </tr>
  <tr>
   <td align="left"> Conditions </td>
   <td align="right"> 12 </td>
   <td align="left"> 0% </td>
   <td align="right"> 961 </td>
   <td align="left"> 65% </td>
  </tr>
  <tr>
   <td align="left"> heritage </td>
   <td align="right"> 39 </td>
   <td align="left"> 15% </td>
   <td align="right"> 489 </td>
   <td align="left"> 49% </td>
  </tr>
  <tr>
   <td align="left"> householder </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 878 </td>
   <td align="left"> 55% </td>
  </tr>
  <tr>
   <td align="left"> Householder </td>
   <td align="right"> 558 </td>
   <td align="left"> 9% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> MajorMajor </td>
   <td align="right"> 3 </td>
   <td align="left"> 0% </td>
   <td align="right"> 144 </td>
   <td align="left"> 39% </td>
  </tr>
  <tr>
   <td align="left"> Minor </td>
   <td align="right"> 188 </td>
   <td align="left"> 9% </td>
   <td align="right"> 887 </td>
   <td align="left"> 40% </td>
  </tr>
  <tr>
   <td align="left"> MinorMajor </td>
   <td align="right"> 16 </td>
   <td align="left"> 0% </td>
   <td align="right"> 450 </td>
   <td align="left"> 41% </td>
  </tr>
  <tr>
   <td align="left"> NMA </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 241 </td>
   <td align="left"> 65% </td>
  </tr>
  <tr>
   <td align="left"> prior </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 374 </td>
   <td align="left"> 58% </td>
  </tr>
  <tr>
   <td align="left"> Reserved matters </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 168 </td>
   <td align="left"> 61% </td>
  </tr>
  <tr>
   <td align="left"> trees </td>
   <td align="right"> 62 </td>
   <td align="left"> 13% </td>
   <td align="right"> 319 </td>
   <td align="left"> 90% </td>
  </tr>
  <tr>
   <td align="left"> use </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
   <td align="right"> 150 </td>
   <td align="left"> 47% </td>
  </tr>
  <tr>
   <td align="left"> Use </td>
   <td align="right"> 45 </td>
   <td align="left"> 20% </td>
   <td align="right"> NA </td>
   <td align="left"> NA </td>
  </tr>
  <tr>
   <td align="left"> NA </td>
   <td align="right"> 440 </td>
   <td align="left"> 7% </td>
   <td align="right"> 201 </td>
   <td align="left"> 70% </td>
  </tr>
</tbody>
</table>


*For review:*
* *The proportion of applications that are invalid.* Anything above your line on the graph is the %age of applications that are invalid on receipt. This represents avoidable time and cost to make them valid. 
* *How do you compare with your peers?* Is there anything you could learn from those achieving a higher proportion of valid applications?
* *What is causing invalid applications.* Don't assume that invalid applications are the sole fault [of the applicant/agent]( http://planningadvisor.wordpress.com/2011/11/24/its-not-you-is-it-me/). Consider whether your validation procedures, processes , consistency and customer guidance are as good as they could be.   
* *What are your applicants and agents saying?* Look over Customer Feedback Section XXXX, is there anything in there that could indicate what the problem with validation might be (e.g. poor guidance, inability to contact a member of staff for advice, inconsistent advice).
* *Are particularly catgories of applications more likely to be invalid than others?* Might there be a need for some proactive work with applicants, or better on-line guidance. 

The next 3 datasets use 'Boxplots'.  Boxplots allow you to see how much variation there is in a set of data - something that a single number like an 'average' doesn't show you. [Click here for a quick and simple guide to boxplots.](http://en.wikipedia.org/wiki/Box_plot) 


4.2  Days to make Valid
-----------------------

Purpose: Shows the number of days it takes for applications to be made valid. A box-plot displays a range of values (days here). If you can't see a line in the middle of the box plot then your median value is zero (that means that at least half of the applications received are made valid on the day they arrive which is good).

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-81.png) ![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-82.png) 

*For review:*
* *The green and blue boxes represent the majotity of applications.* These boxes represent what happens most frequently.
* *The boxes represent a range of days.* The range is the lowest and highest number of days it can take for the majority of applications to be made valid. 
* *Are the heights of the boxes inconsistent e.g. up and down?* The more erratic the picture, the more inconsistent and uncertain the picture for the customer.  
* *Do any of the quarters stand out as particularly different (better or worse)?*
* *Are the heights of the boxes getting smaller over time (taking less time) or taller (taking longer)?* Have you taken any action that might be causing this to happen?
* *This represents avoidable time and cost to the council and applicants.* It doesn't affect National Indicator statistics (the clock starts ticking once the case has been made valid). BUT it all adds to the customer's wait for a decision. 

<table>
 <thead>
  <tr>
   <th align="left"> dev_group </th>
   <th align="right"> count </th>
   <th align="right"> ave_days </th>
   <th align="right"> queue_time </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> Adverts </td>
   <td align="right"> 46 </td>
   <td align="right"> 5 </td>
   <td align="right"> 246 </td>
  </tr>
  <tr>
   <td align="left"> Conditions </td>
   <td align="right"> 12 </td>
   <td align="right"> 6 </td>
   <td align="right"> 66 </td>
  </tr>
  <tr>
   <td align="left"> heritage </td>
   <td align="right"> 39 </td>
   <td align="right"> 5 </td>
   <td align="right"> 179 </td>
  </tr>
  <tr>
   <td align="left"> Householder </td>
   <td align="right"> 558 </td>
   <td align="right"> 6 </td>
   <td align="right"> 3132 </td>
  </tr>
  <tr>
   <td align="left"> MajorMajor </td>
   <td align="right"> 3 </td>
   <td align="right"> 3 </td>
   <td align="right"> 9 </td>
  </tr>
  <tr>
   <td align="left"> Minor </td>
   <td align="right"> 187 </td>
   <td align="right"> 5 </td>
   <td align="right"> 968 </td>
  </tr>
  <tr>
   <td align="left"> MinorMajor </td>
   <td align="right"> 16 </td>
   <td align="right"> 5 </td>
   <td align="right"> 78 </td>
  </tr>
  <tr>
   <td align="left"> trees </td>
   <td align="right"> 62 </td>
   <td align="right"> 5 </td>
   <td align="right"> 291 </td>
  </tr>
  <tr>
   <td align="left"> Use </td>
   <td align="right"> 45 </td>
   <td align="right"> 5 </td>
   <td align="right"> 216 </td>
  </tr>
  <tr>
   <td align="left"> NA </td>
   <td align="right"> 430 </td>
   <td align="right"> 7 </td>
   <td align="right"> 2947 </td>
  </tr>
</tbody>
</table>

*For review:*
* *This table breaks down validation per development type.* The average of the days taken is multiplied out by the number of applications received. This is to show where the biggest amount of  is. 

4.3  Days from declared Valid to Decision issued
------------------------------------------------
*Purpose:* Shows the number of days between applications being declared valid and a decision notice being issued. 

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-91.png) ![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-92.png) 

*For review:* As previous box plot plus
* *Are the 8/13 week targets driving decision making times or do you driven by 'what is the ealiest I can issue the decision'?* Narrow green/blue boxes clustered close to the 56 day mark are an indicator of target-driven decision making.  A lower edge to the box indicates that decisions are issued early. 

4.4  Days from Receipt to Decision issued
-----------------------------------------
*Purpose:* Shows the number of days between applications being received and a decision notice being issued. 

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-101.png) ![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-102.png) 

<table>
 <thead>
  <tr>
   <th align="left"> development category </th>
   <th align="right"> count </th>
   <th align="right"> valid_days </th>
   <th align="right"> NI_days </th>
   <th align="right"> endtoend </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> Adverts </td>
   <td align="right"> 46 </td>
   <td align="right"> 5 </td>
   <td align="right"> 54 </td>
   <td align="right"> 60 </td>
  </tr>
  <tr>
   <td align="left"> Conditions </td>
   <td align="right"> 12 </td>
   <td align="right"> 6 </td>
   <td align="right"> 64 </td>
   <td align="right"> 70 </td>
  </tr>
  <tr>
   <td align="left"> heritage </td>
   <td align="right"> 39 </td>
   <td align="right"> 5 </td>
   <td align="right"> 64 </td>
   <td align="right"> 68 </td>
  </tr>
  <tr>
   <td align="left"> Householder </td>
   <td align="right"> 558 </td>
   <td align="right"> 6 </td>
   <td align="right"> 57 </td>
   <td align="right"> 62 </td>
  </tr>
  <tr>
   <td align="left"> MajorMajor </td>
   <td align="right"> 3 </td>
   <td align="right"> 3 </td>
   <td align="right"> 119 </td>
   <td align="right"> 122 </td>
  </tr>
  <tr>
   <td align="left"> Minor </td>
   <td align="right"> 187 </td>
   <td align="right"> 5 </td>
   <td align="right"> 69 </td>
   <td align="right"> 74 </td>
  </tr>
  <tr>
   <td align="left"> MinorMajor </td>
   <td align="right"> 16 </td>
   <td align="right"> 5 </td>
   <td align="right"> 99 </td>
   <td align="right"> 104 </td>
  </tr>
  <tr>
   <td align="left"> trees </td>
   <td align="right"> 62 </td>
   <td align="right"> 5 </td>
   <td align="right"> 77 </td>
   <td align="right"> 82 </td>
  </tr>
  <tr>
   <td align="left"> Use </td>
   <td align="right"> 45 </td>
   <td align="right"> 5 </td>
   <td align="right"> 65 </td>
   <td align="right"> 70 </td>
  </tr>
  <tr>
   <td align="left"> NA </td>
   <td align="right"> 430 </td>
   <td align="right"> 7 </td>
   <td align="right"> 59 </td>
   <td align="right"> 65 </td>
  </tr>
</tbody>
</table>

*For review:* As previous plus
* *How much difference is there between your reported performance stats (NI_days) and the customers experience (endtoend)?*  

PART 5 - Spotlight on Simple Applications
=======================================================
This section uses the simplest applications (e.g. Householder, trees and change of use - rcode groups 3A, 4A and 9). They represent the largest proportion of your work. Understanding what is happening here can tell you a lot about how the majority of your time and resources are used and to what effect.

5.1 - Application Type
----------------------

*Purpose:* Not all applications represent the same type of work for a council.  This part of the report classifies applications into 'procedure types' based on what action they represent e.g. an 'application' (application process), 'follow up' (action after the decision e.g. conditions), 'Prior' (prior approval) and 'Certificate' (e.g. of lawfulness).  

![plot of chunk app_type](figure/app_type.png) 

*For review:*
* *What is the 'mix' of the work?* Remember the types of development represented here. 
* *Does the proportion of 'follow up' look right for simple developments?* Follow up work can take up significant time and resource for little fee income. 
* *Priors* - How is the permitted development for householders and changes of use affecting workloads? 

5.2 - Application status
----------------------

*Purpose:* This is the pipeline of work indicating how much work has been dealt with (decided), how much is being worked on (on hand), how much has been lost (withdrawn) and the proportion of non-determination appeals being dealt with.

![plot of chunk app_status](figure/app_status.png) 


JOBTODO check this graph
![plot of chunk wip](figure/wip.png) 

*For review:*
* What is the 'mix'? How much work is on hand over the period and are there any resource implications?
* How much work is being appealed and/or withdrawn?  Remember the types of development represented here. Why is development of this type going to appeal?  Why is work being withdrawn. Both represent avoidable cost and waste/duplication of work.


5.3 - Decision Issued
----------------------
*Purpose:* This shows you what proportion of this type of development you say 'yes' (grant) and 'no' (refuse) to. There are 2 additional decisions included - 'split' (part refused, part granted) and 'withdrawn'. 

![plot of chunk dec_issued](figure/dec_issued.png) 

*For review:*
* *Are you refusing significant proportions of this type of development?* Remember the types of development represented here. Why is development of this type being refused?
* *Are you granting permission for significant proportions of this type of development?* Could you standardise/streamline more of the decision making process? 

5.4 - Decision Route
----------------------
*Purpose:* This shows you what proportion of this type of development is decided under delegated powers.  

![plot of chunk dec_route](figure/dec_route.png) 

*For review:*
* *Is the amount of work delegated what you expect?* Remember the types of development represented here. Why is any of this type of development going to committee? 

5.5 - Average end-to-end Times
------------------------------
*Purpose:* Shows the number of days between applications being received and a decision notice being issued month-by-month.

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 

*For review:*
* Do the numbers reflect your reported performance stats? The days reported here are from application receipt not when made valid. This is a better measure of the customer's experience of how long the process really takes. 
* Any lumps and bumps ? (eg xmas) This might reflect fragile arrangements or lack of resources. 

Appendix
========================================================

This is the technical appendix where you can:
1.  Check mappings - have we translated the codes and references that your back-office system uses into the correct Quality Framework name for things?
2.	Check for gaps and errors, and problems with time (e.g. where dates are missing or go backwards)
The codes that you use are shown in the second column. They should all map against the normal framework names for things which are shown in the top row. The tables work using counts of applications. 
There are 3 main things to do/check on each dataset:
* *Do the counts look right?* E.g. are there counts against things that you don't use? Or are the counts lower/higher that you would expect?
* *Note columns that start with "Var.2"* a count in here means the mapping is missing e.g. an application contains this reference but you haven't provided us with a name to map it against.
* *Gaps and errors section* - If there are *significant numbers*, this should be fixed.

Before you check the mappings, check that applications cover the correct chunk of time.

Some of the trends and averages will mislead if the datasets cover different ranges, and if quarters don't have 4 weeks of data the graph may also mislead.

<table>
 <thead>
  <tr>
   <th align="left"> received_quarter </th>
   <th align="right"> received_month </th>
   <th align="right"> cheshirewest </th>
   <th align="right"> ealing </th>
   <th align="right"> haringey </th>
   <th align="right"> liverpool </th>
   <th align="right"> westminster </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> Q1 </td>
   <td align="right"> 1 </td>
   <td align="right"> 0 </td>
   <td align="right"> 69 </td>
   <td align="right"> 42 </td>
   <td align="right"> 59 </td>
   <td align="right"> 0 </td>
  </tr>
  <tr>
   <td align="left"> Q1 </td>
   <td align="right"> 2 </td>
   <td align="right"> 0 </td>
   <td align="right"> 56 </td>
   <td align="right"> 61 </td>
   <td align="right"> 100 </td>
   <td align="right"> 0 </td>
  </tr>
  <tr>
   <td align="left"> Q1 </td>
   <td align="right"> 3 </td>
   <td align="right"> 0 </td>
   <td align="right"> 50 </td>
   <td align="right"> 51 </td>
   <td align="right"> 100 </td>
   <td align="right"> 0 </td>
  </tr>
  <tr>
   <td align="left"> Q2 </td>
   <td align="right"> 4 </td>
   <td align="right"> 0 </td>
   <td align="right"> 50 </td>
   <td align="right"> 53 </td>
   <td align="right"> 81 </td>
   <td align="right"> 0 </td>
  </tr>
  <tr>
   <td align="left"> Q2 </td>
   <td align="right"> 5 </td>
   <td align="right"> 84 </td>
   <td align="right"> 60 </td>
   <td align="right"> 51 </td>
   <td align="right"> 98 </td>
   <td align="right"> 92 </td>
  </tr>
  <tr>
   <td align="left"> Q2 </td>
   <td align="right"> 6 </td>
   <td align="right"> 78 </td>
   <td align="right"> 61 </td>
   <td align="right"> 64 </td>
   <td align="right"> 94 </td>
   <td align="right"> 88 </td>
  </tr>
  <tr>
   <td align="left"> Q3 </td>
   <td align="right"> 7 </td>
   <td align="right"> 67 </td>
   <td align="right"> 47 </td>
   <td align="right"> 57 </td>
   <td align="right"> 67 </td>
   <td align="right"> 83 </td>
  </tr>
  <tr>
   <td align="left"> Q3 </td>
   <td align="right"> 8 </td>
   <td align="right"> 73 </td>
   <td align="right"> 53 </td>
   <td align="right"> 59 </td>
   <td align="right"> 73 </td>
   <td align="right"> 54 </td>
  </tr>
  <tr>
   <td align="left"> Q3 </td>
   <td align="right"> 9 </td>
   <td align="right"> 73 </td>
   <td align="right"> 50 </td>
   <td align="right"> 56 </td>
   <td align="right"> 81 </td>
   <td align="right"> 84 </td>
  </tr>
  <tr>
   <td align="left"> Q4 </td>
   <td align="right"> 10 </td>
   <td align="right"> 86 </td>
   <td align="right"> 48 </td>
   <td align="right"> 55 </td>
   <td align="right"> 72 </td>
   <td align="right"> 78 </td>
  </tr>
  <tr>
   <td align="left"> Q4 </td>
   <td align="right"> 11 </td>
   <td align="right"> 77 </td>
   <td align="right"> 45 </td>
   <td align="right"> 74 </td>
   <td align="right"> 88 </td>
   <td align="right"> 78 </td>
  </tr>
  <tr>
   <td align="left"> Q4 </td>
   <td align="right"> 12 </td>
   <td align="right"> 86 </td>
   <td align="right"> 69 </td>
   <td align="right"> 70 </td>
   <td align="right"> 72 </td>
   <td align="right"> 81 </td>
  </tr>
  <tr>
   <td align="left"> Q5 </td>
   <td align="right"> 13 </td>
   <td align="right"> 75 </td>
   <td align="right"> 71 </td>
   <td align="right"> 70 </td>
   <td align="right"> 66 </td>
   <td align="right"> 63 </td>
  </tr>
  <tr>
   <td align="left"> Q5 </td>
   <td align="right"> 14 </td>
   <td align="right"> 76 </td>
   <td align="right"> 92 </td>
   <td align="right"> 91 </td>
   <td align="right"> 84 </td>
   <td align="right"> 90 </td>
  </tr>
  <tr>
   <td align="left"> Q5 </td>
   <td align="right"> 15 </td>
   <td align="right"> 65 </td>
   <td align="right"> 75 </td>
   <td align="right"> 69 </td>
   <td align="right"> 81 </td>
   <td align="right"> 97 </td>
  </tr>
  <tr>
   <td align="left"> Q6 </td>
   <td align="right"> 16 </td>
   <td align="right"> 86 </td>
   <td align="right"> 76 </td>
   <td align="right"> 54 </td>
   <td align="right"> 57 </td>
   <td align="right"> 80 </td>
  </tr>
  <tr>
   <td align="left"> Q6 </td>
   <td align="right"> 17 </td>
   <td align="right"> 93 </td>
   <td align="right"> 79 </td>
   <td align="right"> 74 </td>
   <td align="right"> 56 </td>
   <td align="right"> 79 </td>
  </tr>
  <tr>
   <td align="left"> Q6 </td>
   <td align="right"> 18 </td>
   <td align="right"> 95 </td>
   <td align="right"> 66 </td>
   <td align="right"> 73 </td>
   <td align="right"> 54 </td>
   <td align="right"> 75 </td>
  </tr>
  <tr>
   <td align="left"> Q7 </td>
   <td align="right"> 19 </td>
   <td align="right"> 72 </td>
   <td align="right"> 75 </td>
   <td align="right"> 74 </td>
   <td align="right"> 26 </td>
   <td align="right"> 73 </td>
  </tr>
  <tr>
   <td align="left"> Q7 </td>
   <td align="right"> 20 </td>
   <td align="right"> 78 </td>
   <td align="right"> 72 </td>
   <td align="right"> 62 </td>
   <td align="right"> 0 </td>
   <td align="right"> 63 </td>
  </tr>
  <tr>
   <td align="left"> Q7 </td>
   <td align="right"> 21 </td>
   <td align="right"> 70 </td>
   <td align="right"> 69 </td>
   <td align="right"> 61 </td>
   <td align="right"> 0 </td>
   <td align="right"> 71 </td>
  </tr>
  <tr>
   <td align="left"> Q8 </td>
   <td align="right"> 22 </td>
   <td align="right"> 75 </td>
   <td align="right"> 76 </td>
   <td align="right"> 88 </td>
   <td align="right"> 0 </td>
   <td align="right"> 80 </td>
  </tr>
</tbody>
</table>

This is the same information by development type so you can check your mappings and those of your comparator group:

<table>
 <thead>
  <tr>
   <th align="left"> dev_group </th>
   <th align="right"> cheshirewest </th>
   <th align="right"> ealing </th>
   <th align="right"> haringey </th>
   <th align="right"> liverpool </th>
   <th align="right"> westminster </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> adverts </td>
   <td align="right"> 34 </td>
   <td align="right"> 35 </td>
   <td align="right"> 0 </td>
   <td align="right"> 123 </td>
   <td align="right"> 163 </td>
  </tr>
  <tr>
   <td align="left"> Adverts </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 46 </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
  </tr>
  <tr>
   <td align="left"> cert </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 19 </td>
  </tr>
  <tr>
   <td align="left"> Conditions </td>
   <td align="right"> 622 </td>
   <td align="right"> 233 </td>
   <td align="right"> 12 </td>
   <td align="right"> 106 </td>
   <td align="right"> 0 </td>
  </tr>
  <tr>
   <td align="left"> heritage </td>
   <td align="right"> 69 </td>
   <td align="right"> 39 </td>
   <td align="right"> 39 </td>
   <td align="right"> 91 </td>
   <td align="right"> 290 </td>
  </tr>
  <tr>
   <td align="left"> householder </td>
   <td align="right"> 111 </td>
   <td align="right"> 356 </td>
   <td align="right"> 0 </td>
   <td align="right"> 342 </td>
   <td align="right"> 69 </td>
  </tr>
  <tr>
   <td align="left"> Householder </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 558 </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
  </tr>
  <tr>
   <td align="left"> MajorMajor </td>
   <td align="right"> 14 </td>
   <td align="right"> 4 </td>
   <td align="right"> 3 </td>
   <td align="right"> 125 </td>
   <td align="right"> 1 </td>
  </tr>
  <tr>
   <td align="left"> Minor </td>
   <td align="right"> 215 </td>
   <td align="right"> 241 </td>
   <td align="right"> 188 </td>
   <td align="right"> 40 </td>
   <td align="right"> 391 </td>
  </tr>
  <tr>
   <td align="left"> MinorMajor </td>
   <td align="right"> 56 </td>
   <td align="right"> 14 </td>
   <td align="right"> 16 </td>
   <td align="right"> 366 </td>
   <td align="right"> 14 </td>
  </tr>
  <tr>
   <td align="left"> NMA </td>
   <td align="right"> 174 </td>
   <td align="right"> 15 </td>
   <td align="right"> 0 </td>
   <td align="right"> 24 </td>
   <td align="right"> 28 </td>
  </tr>
  <tr>
   <td align="left"> prior </td>
   <td align="right"> 0 </td>
   <td align="right"> 301 </td>
   <td align="right"> 0 </td>
   <td align="right"> 65 </td>
   <td align="right"> 8 </td>
  </tr>
  <tr>
   <td align="left"> Reserved matters </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 168 </td>
  </tr>
  <tr>
   <td align="left"> trees </td>
   <td align="right"> 0 </td>
   <td align="right"> 126 </td>
   <td align="right"> 62 </td>
   <td align="right"> 113 </td>
   <td align="right"> 80 </td>
  </tr>
  <tr>
   <td align="left"> use </td>
   <td align="right"> 29 </td>
   <td align="right"> 39 </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 82 </td>
  </tr>
  <tr>
   <td align="left"> Use </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
   <td align="right"> 45 </td>
   <td align="right"> 0 </td>
   <td align="right"> 0 </td>
  </tr>
  <tr>
   <td align="left"> NA </td>
   <td align="right"> 85 </td>
   <td align="right"> 6 </td>
   <td align="right"> 440 </td>
   <td align="right"> 14 </td>
   <td align="right"> 96 </td>
  </tr>
</tbody>
</table>


Colophon
----------------------------------
This is a draft report for the Planning Quality Framework. It is version 0.6 last changed on 2014-09-03. It was generated on 2014-09-26. 

This is a project from the [Planning Advisory Service](http://pas.gov.uk). There is more information at our [project pages](http://www.pas.gov.uk/events-and-support2/-/journal_content/56/332612/5730199/ARTICLE)

With thanks to the makers of the [R Language](http://www.r-project.org/) the [R Studio](http://www.rstudio.org), and marvellous libraries [ggplot2](http://ggplot2.org/) and [KnitR](http://yihui.name/knitr/)


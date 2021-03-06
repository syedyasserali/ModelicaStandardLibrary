within Modelica.Clocked;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;
  package GettingStarted "Getting started"
    extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>
Please explore the
<a href=\"modelica://Modelica.Clocked.Examples\">Examples</a>,
which provide simple models for a broad variety of applications.
</p>
<p>
A central element of the Modelica.Clocked library is a <strong>clock</strong>.
For an introduction to clocks see <a href=\"modelica://Modelica.Clocked.UsersGuide.Clocks\">UsersGuide.Clocks</a>.
</p>
</html>"));
  end GettingStarted;

  class Clocks "Clocks"
    extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>
A central element of the Modelica.Clocked library is a <strong>clock</strong>.
Below, the most important information for clocks is summarized.
For more details, see the Modelica Language Specification,
Chapter 16 (for Modelica Language Version &ge; 3.3).
</p>

<p>
A <strong>Clock</strong> type is a base data type (introduced in Modelica 3.3, additionally to Real, Integer, Boolean, String) that defines when a particular partition consisting of a set of equations is active. Starting with Modelica Language Version 3.3, every variable and every equation is either continuous-time or is associated exactly to one clock. This feature is visualized in the figure below where c(ti) is a clock that is active at particular time instants ti and r(ti) is a variable that is associated to this clock. A clocked variable has only a value when the corresponding clock is active:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Clocked/Clocks/clockSignals.png\" alt=\"Clock variables and clocked variables\">
</p>

<p>
Similarly to RealInput, RealOutput etc., clock input and output connectors, called ClockInput and ClockOutput, are defined in sublibrary
<a href=\"modelica://Modelica.Clocked.ClockSignals.Interfaces\">ClockSignal.Interfaces</a>
in order to propagate clocks via connections. A clock signal can be generated with
one of the blocks of sublibrary
<a href=\"modelica://Modelica.Clocked.ClockSignals.Clocks\">ClockSignals.Clocks</a>:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Clocked/Clocks/clocks.png\" alt=\"Sublibrary ClockSignals.Clocks\">
</p>

<p>
The output signals of the blocks in the above figure are clock signals,
by default visualized with dotted grey lines.
</p>

<p>
With the blocks of sublibrary
<a href=\"modelica://Modelica.Clocked.ClockSignals.Sampler\">ClockSignals.Sampler</a>
a clock signal can be sub-sampled, super-sampled, or shift-sampled to generate
a new clock signal. For example, with the following model, a periodic clock signal of 0.1 s
is sub-sampled with a factor 3 and therefore a clock signal with a period of 0.3 s
is generated:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Clocked/Clocks/subSampledClockExample.png\" alt=\"Sub-sample example model\"><br>
<img src=\"modelica://Modelica/Resources/Images/Clocked/Clocks/subSampledClockResult.png\" alt=\"Sub-sample example plot\">
</p>

<p>
As usual in synchronous languages, a clock is represented by a <strong>true</strong> value
when the clock is active. The relationship between such derived
clocks is <strong>exact</strong>, so it is guaranteed that at every 3rd tick of clock
\"periodicRealClock.y\", the clock \"subSample.y\" is active.
</p>

<p>
If a clock is associated to a clocked continuous-time partition, then an <strong>integrator</strong>
has to be defined that is used to integrate the partition from the previous
to the current clock tick. This is performed by setting parameter <strong>useSolver</strong>
= <strong>true</strong> and defining the integration method as String with
parameter <strong>solver</strong>. Both parameters are in tab <strong>Advanced</strong>
of one of the clock signal generating blocks.
The possible integration methods are tool dependent. It is expected that
at least the solvers \"External\" (= use the integrator selected in the
simulation environment) and \"ExplicitEuler\" (= explicit Euler method)
are supported by every tool. For an example, see
<a href=\"modelica://Modelica.Clocked.Examples.Systems.ControlledMixingUnit\">Examples.Systems.ControlledMixingUnit</a>.
</p>

<p>
A clocked partition is a set of equations that depend
on each other and where the boundary variables are marked
with sample and hold operators.
If a clocked partition contains no operator <strong>der</strong>, <strong>delay</strong>,
<strong>spatialDistribution</strong>, no event related operators (with exception of <strong>noEvent</strong>(&hellip;)),
and no <strong>when</strong>-clause with a Boolean condition, it is a <strong>clocked discrete-time</strong>
partition, that is, it is a standard sampled data system that is described by difference equations.
If a clocked partition is <strong>not</strong> a <strong>clocked discrete-time</strong> partition and
it contains neither operator <strong>previous</strong> nor operator
<strong>interval</strong>, it is a
<strong>clocked discretized continuous-time</strong> partition.
Such a partition has to be solved with a <strong>solver</strong> method.
It is an error, if none of the two properties hold, e.g., if operators
<strong>previous</strong> and <strong>der</strong> are both used in the same partition.
In a clocked discrete-time partition all event generating mechanisms
do no longer apply. Especially neither relations, nor one of the built-in event
triggering operators will trigger an event.
</p>
</html>"));
  end Clocks;

  class Literature "Literature"
    extends Modelica.Icons.References;
    annotation (Documentation(info="<html>

<p>
<em>This library is based on the following references:</em>
<br>
</p>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>[Astrom2008]</td>
    <td>K.J. Astr&ouml;m, B. Wittenmark,
      <em>Computer Controlled Systems: Theory and Design</em>,
      3rd ed.: Prentice Hall, 1997.</td>
  </tr>
  <tr>
    <td>[Elmqvist2012]</td>
    <td>H. Elmqvist, M. Otter, S.E. Mattsson,
      \"Fundamentals of Synchronous Control in Modelica,\"
      In <em>Proceedings of 9th International Modelica Conference</em>,
      Munich, Germany, Sep. 3-5, 2012.
      <a href=\"https://www.doi.org/10.3384/ecp1207615\">DOI:10.3384/ecp1207615</a>.</td>
  </tr>
  <tr>
    <td>[Otter2012]</td>
    <td>M. Otter, B. Thiele, S.E. Mattsson,
      \"A Library for Synchronous Control Systems in Modelica,\"
      In <em>Proceedings of 9th International Modelica Conference</em>,
      Munich, Germany, Sep. 3-5, 2012.
      <a href=\"https://www.doi.org/10.3384/ecp1207627\">DOI:10.3384/ecp1207627</a>.</td>
  </tr>
  <tr>
    <td>[Walther2002]</td>
    <td>N. Walther,
      \"Praxisgerechte Modelica-Bibliothek f&uuml;r Abtastregler,\"
      Diplomarbeit, HTWK Leipzig, Fachbereich Elektro- und Informationstechnik,
      supervised by Prof. M&uuml;ller (HWTK) and Prof. Martin Otter (DLR), 12 Nov. 2002.</td>
  </tr>
</table>

<p>
<em>
The synchronous Modelica language elements allow for the first
time to utilize a continuous-time, nonlinear, inverse model in
a Modelica sampled-data system, by automatically discretizing
this model and providing it as a clocked partition. This allows
a convenient definition of certain nonlinear control systems,
see example
<a href=\"modelica://Modelica.Clocked.Examples.Systems.ControlledMixingUnit\">Examples.Systems.ControlledMixingUnit</a>.
Several practical details to use nonlinear inverse plant models in
a control system are discussed in the following reference:</em>
<br>
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>[Looye2005]</td>
    <td>G. Looye, M. Th&uuml;mmel, M. Kurze, M. Otter, and J. Bals,
      \"Nonlinear Inverse Models for Control\",
      In <em>Proceedings of 4th International Modelica Conference</em>,
      Hamburg, Germany, Mar. 7-8, 2005.
      <a href=\"https://www.modelica.org/events/Conference2005/online_proceedings/Session3/Session3c3.pdf\">Download</a>.</td>
  </tr>
</table>

<p>
<em>
The synchronous Modelica language elements used in this library
are based on the clock calculus and inference system proposed by [Colaco2003]
and implemented in Lucid Synchrone version 2 and 3 [Pouzet2006].
However, the Modelica approach also uses multi-rate periodic clocks based on
rational arithmetic introduced by [Forget2008], as an extension of
the Lucid Synchrone semantics. These approaches belong to the class of
synchronous languages [Benveniste2003]:</em>
<br>
</p>

<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>[Benveniste2003]</td>
    <td>A. Benveniste, P. Caspi, S.A. Edwards, N. Halbwachs, P. Le Guernic, and R. Simone,
      \"The Synchronous Languages Twelve Years Later,\"
      In <em>Proceedings of the IEEE</em>,
      Vol., 91, No. 1, 2003.
      <a href=\"http://www.irisa.fr/distribcom/benveniste/pub/synch_ProcIEEE_2002.pdf\">Download</a>.</td>
  </tr>
  <tr>
    <td>[Colaco2003]</td>
    <td>J.-L. Colaco, and M. Pouzet,
      \"Clocks as First Class Abstract Types,\"
      In <em>Third International Conference on Embedded Software (EMSOFT'03)</em>,
      Philadelphia, Pennsylvania, USA, October 2003.
      <a href=\"http://www.di.ens.fr/~pouzet/lucid-synchrone/papers/emsoft03.ps.gz\">Download</a>.</td>
  </tr>
  <tr>
    <td>[Forget2008]</td>
    <td>J. Forget, F. Boniol, D. Lesens, C. Pagetti,
      \"A Multi-Periodic Synchronous Data-Flow Language,\"
      In <em>11th IEEE High Assurance Systems Engineering Symposium (HASE'08)</em>,
      pp. 251-260, Nanjing, China, Dec. 3-5, 2008.
      <a href=\"http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&amp;arnumber=4708883&amp;contentType=Conference+Publications\">Download</a>.</td>
  </tr>
  <tr>
    <td>[Pouzet2006]</td>
    <td>M. Pouzet,
      \"Lucid Synchrone, Version 3.0, Tutorial and Reference Manual\".
      <a href=\"http://www.di.ens.fr/~pouzet/lucid-synchrone/\">Download</a>.</td>
  </tr>
</table>

</html>"));
  end Literature;

  package ReleaseNotes "Release notes"
    extends Modelica.Icons.ReleaseNotes;
    class Version_0_93_0 "Version 0.93.0 (April 10, 2019)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (Documentation(info="<html>
<p>
Version 0.93.0 is backward compatible to version 0.92.1
</p>

<p>Enhancements:</p>
<ul>
<li>Uses latest version of Modelica Standard Library (v3.2.3) (<a href=\"https://github.com/modelica/Modelica_Synchronous/issues/37\">#37</a>).</li>
<li>New blocks for event clocks that generate a clock tick each time an observed input angle changed (subpackage <a href=\"modelica://Modelica.Clocked.ClockSignals.Clocks.Rotational\">ClockSignals.Clocks.Rotational</a>) (<a href=\"https://github.com/modelica/Modelica_Synchronous/issues/34\">#34</a>, <a href=\"https://github.com/modelica/Modelica_Synchronous/issues/36\">#36</a>).</li>
<li>Improved engine-throttle control example using the new rotational event clocks (<a href=\"https://github.com/modelica/Modelica_Synchronous/issues/34\">#32</a>, <a href=\"https://github.com/modelica/Modelica_Synchronous/issues/36\">#33</a>).</li>
<li>Utilizing `SolverMethod` from the (tool-specific) ModelicaServices library (<a href=\"https://github.com/modelica/Modelica_Synchronous/issues/20\">#20</a>).</li>
<li>Improved icons.</li>
</ul>
<p>Bug fixes:</p>
<ul>
<li>Added tolerance for numeric comparisons <a href=\"modelica://Modelica.Clocked.BooleanSignals.TimeBasedSources.Pulse\">BooleanSignals.TimeBasedSources.Pulse</a> (<a href=\"https://github.com/modelica/Modelica_Synchronous/issues/9\">#9</a>).</li>
<li>Fixed over-constrained initial systems for several examples (<a href=\"https://github.com/modelica/Modelica_Synchronous/issues/10\">#10</a>, <a href=\"https://github.com/modelica/Modelica_Synchronous/issues/11\">#11</a>).</li>
<li>Fixed comparison against Real in <a href=\"modelica://Modelica.Clocked.BooleanSignals.TickBasedSources.Pulse\">BooleanSignals.TickBasedSources.Pulse</a> (<a href=\"https://github.com/modelica/Modelica_Synchronous/issues/12\">#12</a>).</li>
<li>Fixed too slow sampling in <a href=\"modelica://Modelica.Clocked.Examples.CascadeControlledDrive\">CascadeControlledDrive</a> examples (<a href=\"https://github.com/modelica/Modelica_Synchronous/issues/30\">#30</a>).</li>
</ul>

<p>Other (minor) fixes and improvements.</p>
</html>"));
    end Version_0_93_0;

    class Version_0_92_1 "Version 0.92.1 (March 11, 2016)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (Documentation(info="<html>
<p>
Version 0.92.1 is backward compatible to version 0.92
</p>

<p>
This version uses package Modelica 3.2.2.
</p>

<p>
Changes with respect to version 0.92:
</p>

<ul>
<li> RealSignals.Sampler: Removed wrong double declaration of u and y
    (was present due to extends and due to explicit declaration)</li>
<li> Invalid links in documentation fixed (#1341)</li>
<li> BooleanSignals.TickBasedSources.Pulse wrong unit fixed (#1889)</li>
<li> Missing useClock parameter in RealSignals.Sampler.AssignClock fixed (#1919)</li>
<li> Set Evaluate=true to clock parameters of {Real,Integer,Boolean}Signals.Sampler.{Shift,Back}Sample(OpenModelica Ticket 3717)</li>
</ul>
</html>"));
    end Version_0_92_1;

    class Version_0_92 "Version 0.92 (Sept. 19, 2013)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (Documentation(info="<html>
<p>
Version 0.92 is backward compatible to version 0.91
</p>

<p>
Changes with respect to version 0.91:
</p>

<ul>
<li> The library uses the latest Modelica Standard Library (MSL) version 3.2.1 (but still works with version 3.2). </li>
<li> Added a couple of convenience source blocks for Real, Integer, and Boolean signals that are similar to the blocks
     found in the MSL, but have as output a clocked signal.</li>
<li> Added a couple of source blocks that are parametrized in terms of clock ticks rather than simulation time.</li>
<li> All new blocks are utilized in at least one test.</li>
</ul>
</html>"));
    end Version_0_92;

    class Version_0_91 "Version 0.91 (Sept. 20, 2012)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (Documentation(info="<html>
<p>
First version of the library provided on the Modelica web page.
Changes with respect to version 0.9:
</p>

<ul>
<li> The library has been slightly restructured. </li>
<li> Documentation has been significantly enhanced
     (nearly all elements of the library are documented now).</li>
<li> Simple examples have been added for many
     blocks of the library in the new package
     <a href=\"modelica://Modelica.Clocked.Examples.Elementary\">Examples.Elementary</a>.
     These blocks have been used to generate the figures in the documentation of
     many blocks. Furthermore, they are used for testing these blocks.</li>
</ul>

<p>
The library has been tested with Dymola 2013 FD01:
</p>

<ul>
<li> \"Check\" with \"Pedantic = true\" is successful (so the library should be completely compatible
     to the Modelica 3.3 specification).</li>
<li> \"Check with Simulation\" is successful.</li>
<li> The tests have a class coverage of 100 %
     (that is every class of the library is utilized in at least
     one test).</li>
<li> The results of the test models have been either manually checked,
     or compared with results of the Modelica_LinearSystems.Controller or
     the Modelica.Blocks.Discrete library.</li>
</ul>

<p>
The library has also been tested with the MapleSim Standalone Modelica parser
(so also another Modelica tool deduces that the library is fully compliant to
Modelica).
</p>
</html>"));
    end Version_0_91;

    class Version_0_9 "Version 0.9 (Aug. 28, 2012)"
      extends Modelica.Icons.ReleaseNotes;
      annotation (Documentation(info="<html>
<p>
This library version has been used
by the participants of a tutorial at the 9th
Modelica Conference 2012.
</p>
</html>"));
    end Version_0_9;
    annotation (Documentation(info="<html>
<p>
This section summarizes the changes that have been performed
on the Modelica.Clocked library.
</p>
</html>"));
  end ReleaseNotes;

  class Requirements "Requirements"
    extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>
This library is basically a graphical user interface to conveniently
operate with the Modelica 3.3 language elements of Chapter 16
\"Synchronous Language Elements\" of the Modelica Language Specification 3.3.
Every tool that supports these language
elements, as well as basic language elements of Modelica 3.1, should be
able to support this library.
</p>
</html>"));
  end Requirements;

  class Contact "Contact"
    extends Modelica.Icons.Contact;
    annotation (Documentation(info="<html>
<h4>Main authors</h4>

<dl>
<dt><strong>Martin Otter</strong></dt>
<dd>email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a></dd>
<dt><strong>Bernhard Thiele</strong></dt>
<dd>email: <a href=\"mailto:Bernhard.Thiele@dlr.de\">Bernhard.Thiele@dlr.de</a></dd>
</dl>

<dl>
<dt>Address</dt>
<dd>German Aerospace Center (DLR)<br>
Robotics and Mechatronics Center<br>
Institute of System Dynamics and Control<br>
Postfach 1116<br>
D-82234 Wessling<br>
Germany</dd>
</dl>

<h4>Acknowledgements</h4>

<ul>
<li> The design of the library has been performed in close cooperation and discussion
     with Hilding Elmqvist from Dassault Syst&egrave;mes Lund.</li>

<li> Sven Erik Mattsson from Dassault Syst&egrave;mes Lund developed the first
     Dymola prototype supporting the synchronous features of Modelica 3.3.
     Without this prototype, it would not have been possible to develop the
     Modelica_Synchronous library (the basis of this library).</li>
</ul>
</html>"));
  end Contact;
  annotation (DocumentationClass=true, Documentation(info="<html>
<p>
Library <strong>Modelica.Clocked</strong> is a Modelica package
to precisely define and synchronize sampled data systems with different sampling rates. This package contains the <strong>user's guide</strong> for
the library and has the following content:
</p>
<ol>
<li><a href=\"modelica://Modelica.Clocked.UsersGuide.GettingStarted\">Getting started</a>
    contains an introduction to the most important features and how
    to use them.</li>
<li><a href=\"modelica://Modelica.Clocked.UsersGuide.Literature\">Literature</a>
    provides references that have been used to design and implement this
    library.</li>
<li><a href=\"modelica://Modelica.Clocked.UsersGuide.ReleaseNotes\">Release Notes</a>
    summarizes the differences between different versions of this library.</li>
<li><a href=\"modelica://Modelica.Clocked.UsersGuide.Requirements\">Requirements</a>
    sketches the requirements on a Modelica tool, in order that this library
    can be utilized.</li>
<li><a href=\"modelica://Modelica.Clocked.UsersGuide.Contact\">Contact</a>
    provides information about the authors of the library as well as
    acknowledgments.</li>
</ol>
</html>"));
end UsersGuide;

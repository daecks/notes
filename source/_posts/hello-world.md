---
title: Hello World
categories:
- web
- blog
tags:
- Hexo
- markdown
- html
mathjax: true
date: 2016-07-06
readingtime: 5
---
Hello [Hexo](https://hexo.io/)!

I'm back again, since more than a year ago, I just started writing blog, and after I tried several times, I gave up. The reason is that I'm not ready, I'm just curious for the web things. This time, I'll begin write something that deserve to write, from machine learning to software developing and maybe some thoughts on my research.

This first post is mainly for testing various features.
<!-- more -->

## Basics

This part is about some simple usage of Markdown grammar. i.e.

# H1
## H2
### H3
#### H4
##### H5
###### H6

```
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

**bold, strong**

*italic, emphasis*

***bold and italic***

~~Delete~~

list:
1. one
2. two
3. three
 - subone
 - subtwo

```
**bold, strong**

*italic, emphasis*

***bold and italic***

~~Delete~~

1. one
2. two
3. three
 - subone
 - subtwo
```


## Footnotes

basic footnote[^1]
here is an inline footnote[^2](inline footnote)
and another one[^3]
and another one[^4]

[^1]: basic footnote content
[^3]: paragraph
footnote
content
[^4]: footnote content with some [markdown](https://en.wikipedia.org/wiki/Markdown)

## Equations


Simple inline: $a^2 = b^2 + \frac{d}{\sqrt{c}}$.
This is an example for $x_mu$ and $y_mu$.
Display

$$\frac{\partial u}{\partial t}
= h^2 \left( \frac{\partial^2 u}{\partial x^2} +
\frac{\partial^2 u}{\partial y^2} +
\frac{\partial^2 u}{\partial z^2}\right)
$$

Aligning equations
$$
\begin{aligned}
\dot{x} & = \sigma(y-x) \\\
\dot{y} & = \rho x - y - xz \\\
\dot{z} & = -\beta z + xy
\end{aligned}
$$


Equations with numbering
$$
\begin{equation}\label{2.1}
\begin{split}
a =& b+c-d \\\
   & {}+e-f \\\
  =& g+h \\\
  =& i
\end{split}
\end{equation}
$$

Equations with cases
$$
f(n) =
\begin{cases}
\frac{n}{2},  & \text{if $n$ is even} \\\
3n+1, & \text{if $n$ is odd}
\end{cases}
$$

## Blocks
{% alert info %}
Here is a info alert
{% endalert %}

{% alert success %}
Here is a success alert
{% endalert %}

{% alert warning %}
Here is a warning alert
{% endalert %}

{% alert danger %}
Here is a danger alert
{% endalert %}

{% alert danger no-icon %}
Here is a danger alert without icon
{% endalert %}

## Highlight Text
{% hl_text danger %}
  danger
{% endhl_text %}

{% hl_text warning %}
  warning
{% endhl_text %}

{% hl_text primary %}
  primary
{% endhl_text %}

{% hl_text success %}
  success
{% endhl_text %}

{% hl_text cyan %}
  success
{% endhl_text %}

{% hl_text yellow %}
  yellow
{% endhl_text %}

{% hl_text orange %}
  orange
{% endhl_text %}

{% hl_text purple %}
  purple
{% endhl_text %}

{% hl_text blue %}
  blue
{% endhl_text %}

{% hl_text green %}
  green
{% endhl_text %}

{% hl_text red %}
  red
{% endhl_text %}


## Codes


``` bash
$ hexo new "My New Post"
```

{% codeblock Java example lang:java https://highlightjs.org/ Source %}
/**
 * @author John Smith <john.smith@example.com>
*/
package l2f.gameserver.model;

public abstract class L2Char extends L2Object {
  public static final Short ERROR = 0x0001;

  public void moveTo(int x, int y, int z) {
    _ai = null;
    log("Should not be called");
    if (1 > 5) { // wtf!?
      return;
    }
  }
}

{% endcodeblock %}

{% codeblock Python example lang:python https://highlightjs.org/ Source %}
@requires_authorization
def somefunc(param1='', param2=0):
    r'''A docstring'''
    if param1 > param2: # interesting
        print 'Gre\'ater'
    return (param2 - param1 + 1 + 0b10l) or None

class SomeClass:
    pass
>>> message = '''interpreter
... prompt'''

{% endcodeblock %}



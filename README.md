# IPL4EO: Environment Setup and Lab Instructions
================================================

This guide provides setup instructions for:

**An Introduction to the Practical Lectures**
as part of the **IPL4EO** course.

------------------------------------------------------------
Installation
------------------------------------------------------------

Install the required environment manager (uv) using the standalone installer:

https://docs.astral.sh/uv/getting-started/installation/#standalone-installer

------------------------------------------------------------
Environment Setup
------------------------------------------------------------

Clone the environment specification repository:

    git clone https://github.com/JonasKlotz/ipl4eo-dependencies
    cd ipl4eo-dependencies/

Install the environment (choose one depending on your system):

    uv sync --python 3.12 --extra cpu
    # or for GPU:
    uv sync --python 3.12 --extra cu11

------------------------------------------------------------
Run Jupyter
------------------------------------------------------------

Create a folder for labs and move the notebook there:

    mkdir labs
    mv lab01.ipynb labs/

Start Jupyter Lab:

    uv run --with jupyter jupyter lab

You can now access the notebook environment in your browser.

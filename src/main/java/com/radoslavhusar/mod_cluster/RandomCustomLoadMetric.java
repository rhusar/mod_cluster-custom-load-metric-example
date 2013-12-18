package com.radoslavhusar.mod_cluster;

import java.util.Random;

import org.jboss.modcluster.container.Engine;
import org.jboss.modcluster.load.metric.impl.AbstractLoadMetric;

/**
 * @author Radoslav Husar
 * @version Dec 2013
 */
public class RandomCustomLoadMetric extends AbstractLoadMetric {

    private Random random;
    private int seed;

    public RandomCustomLoadMetric() {
        System.out.println("constructor");
    }

    public int getSeed() {
        return seed;
    }

    public void setSeed(int seed) {
        this.seed = seed;

        System.out.println("setting seed: " + seed);

        random = new Random();
        random.setSeed(seed);
    }

    @Override
    public double getLoad(Engine engine) throws Exception {
        double load = random.nextDouble();

        System.out.println("random load: " + load);

        return load;
    }
}

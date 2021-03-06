/*-
 * #%L
 * common-incremental
 * %%
 * Copyright (C) 2017 Helsingin ja Uudenmaan sairaanhoitopiiri, Helsinki, Finland
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */

package fi.tietoallas.incremental.common.commonincremental.monitoring;

import java.util.ArrayList;
import java.util.List;

import io.prometheus.client.Collector;

/**
 * Prometheus Collector for storing MetricFamilySamples
 *
 * @author Antti Kalliokoski
 */
public class IntegrationCollection extends Collector {

    private List<MetricFamilySamples> samplesList = new ArrayList<>();

    public void add(final MetricFamilySamples sample) {
        samplesList.add(sample);
    }

    @Override
    public List<MetricFamilySamples> collect() {
        return samplesList;
    }
}
